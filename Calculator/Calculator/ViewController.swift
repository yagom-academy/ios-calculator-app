//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    private var isOperandinputed = false
    private var isCalculateCompleted = false
    private var mathematicalExpression = ""
    
    @IBOutlet private weak var mathematicalExpressionStackView: UIStackView!
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var operandLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func acButtonAction(_ sender: UIButton) {
        reset()
    }
    
    @IBAction private func ceButtonAction(_ sender: UIButton) {
        if isCalculateCompleted {
            reset()
        }
        
        operandLabel.text = "0"
        isOperandinputed = false
    }
    
    @IBAction private func switchSignButton(_ sender: UIButton) {
        guard !isCalculateCompleted else {
            return
        }
        guard let operandLabelText = operandLabel.text else {
            return
        }
        guard let operand = Double(operandLabelText) else {
            return
        }
        guard operand != 0.0 else {
            return
        }
        
        operandLabel.text = String(-operand)
    }
    
    @IBAction private func operatorsButtonAction(_ sender: UIButton) {
        guard !isCalculateCompleted else {
            return
        }
        guard isOperandinputed else {
            operatorLabel.text = sender.currentTitle
            return
        }
        let operatorOfSignLabel = createLabel(text: operatorLabel.text)
        let operandOfSignLabel = createLabel(text: operandLabel.text)
        
        if mathematicalExpressionStackView.subviews.isEmpty {
            createStackView(operandOfSignLabel)
            mathematicalExpression += "\(operandLabel.text ?? "") "
        } else {
            createStackView(operatorOfSignLabel, operandOfSignLabel)
            mathematicalExpression += " \(operatorLabel.text ?? "") \(operandLabel.text ?? "")"
        }
        
        operatorLabel.text = sender.currentTitle
        operandLabel.text = "0"
        isOperandinputed = false
    }
    
    @IBAction private func operandsButtonAction(_ sender: UIButton) {
        guard !isCalculateCompleted else {
            return
        }
        if !isOperandinputed {
            operandLabel.text = sender.currentTitle
            isOperandinputed = true
        } else {
            operandLabel.text = (operandLabel.text ?? "") + (sender.currentTitle ?? "")
            isOperandinputed = true
        }
    }
    
    @IBAction private func calculateButtonAction(_ sender: UIButton) {
        guard isOperandinputed else {
            return
        }
        guard !mathematicalExpressionStackView.subviews.isEmpty else {
            return
        }
        
        let operatorOfSignLabel = createLabel(text: operatorLabel.text)
        let operandOfSignLabel = createLabel(text: operandLabel.text)
        createStackView(operatorOfSignLabel, operandOfSignLabel)
        mathematicalExpression += " \(operatorLabel.text ?? "") \(operandLabel.text ?? "")"
        
        operandLabel.text = mathematicalExpression
        operatorLabel.text = ""
        mathematicalExpression = ""
        
        isOperandinputed = false
        isCalculateCompleted = true
    }
    
    private func reset() {
        mathematicalExpressionStackView.subviews.forEach { $0.removeFromSuperview() }
        operandLabel.text = "0"
        operatorLabel.text = ""
        mathematicalExpression = ""
        isOperandinputed = false
        isCalculateCompleted = false
    }
    
    private func createLabel(text: String?) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = .white
        return label
    }
    
    private func createStackView(_ labels: UIView...) {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 8
        for label in labels {
            stackView.addArrangedSubview(label)
        }
        mathematicalExpressionStackView.addArrangedSubview(stackView)
    }
}


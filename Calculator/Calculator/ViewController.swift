//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var isOperandValueEmpty = false
    var isCalculateCompleted = false
    var mathematicalExpression = ""
    
    @IBOutlet weak var mathematicalExpressionStackView: UIStackView!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var operandLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func acButtonAction(_ sender: UIButton) {
        mathematicalExpressionStackView.subviews.forEach { $0.removeFromSuperview() }
        operandLabel.text = "0"
        operatorLabel.text = ""
        mathematicalExpression = ""
        isOperandValueEmpty = false
        isCalculateCompleted = false
    }
    
    @IBAction func ceButtonAction(_ sender: UIButton) {
        if isCalculateCompleted {
            mathematicalExpressionStackView.subviews.forEach { $0.removeFromSuperview() }
            mathematicalExpression = ""
            isCalculateCompleted = false
        }
        operandLabel.text = "0"
        isOperandValueEmpty = false
    }
    
    @IBAction func switchSignButton(_ sender: UIButton) {
        guard !isCalculateCompleted else {
            return
        }
        guard let operandLabelText = operandLabel.text else {
            return
        }
        guard let operand = Int(operandLabelText) else {
            return
        }
        guard operand != 0 else {
            return
        }
        operandLabel.text = String(-Int(operand))
    }
    
    @IBAction func operatorsButtonAction(_ sender: UIButton) {
        guard !isCalculateCompleted else {
            return
        }
        guard isOperandValueEmpty else {
            operatorLabel.text = sender.currentTitle
            return
        }
        
        let operatorOfSignLabel: UILabel = {
            let label = UILabel()
            label.text = operandLabel.text
            label.font = UIFont.systemFont(ofSize: 25)
            label.textColor = .white
            return label
        }()
        
        let operandOfSignLabel: UILabel = {
            let label = UILabel()
            label.text = operatorLabel.text
            label.font = UIFont.systemFont(ofSize: 25)
            label.textColor = .white
            return label
        }()
        
        let signStackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [operandOfSignLabel, operatorOfSignLabel])
            stackView.axis = .horizontal
            stackView.distribution = .fill
            stackView.alignment = .fill
            stackView.spacing = 8
            return stackView
        }()
        
        operatorLabel.text = sender.currentTitle
        mathematicalExpressionStackView.addArrangedSubview(signStackView)
        mathematicalExpression += "\(operandLabel.text ?? "") \(operatorLabel.text ?? "") "
        operandLabel.text = "0"
        isOperandValueEmpty = false
    }
    
    @IBAction func operandsButtonAction(_ sender: UIButton) {
        guard !isCalculateCompleted else {
            return
        }
        if !isOperandValueEmpty {
            operandLabel.text = sender.currentTitle
            isOperandValueEmpty = true
        } else {
            operandLabel.text = (operandLabel.text ?? "") + (sender.currentTitle ?? "")
            isOperandValueEmpty = true
        }
    }
    
    @IBAction func calculateButtonAction(_ sender: UIButton) {
        guard let operandString = operandLabel.text else {
            return
        }
        guard isOperandValueEmpty else {
            return
        }
        guard operatorLabel.text != "" else {
            return
        }
        
        let operatorOfSignLabel: UILabel = {
            let label = UILabel()
            label.text = operandLabel.text
            label.font = UIFont.systemFont(ofSize: 25)
            label.textColor = .white
            return label
        }()
        
        let operandOfSignLabel: UILabel = {
            let label = UILabel()
            label.text = operatorLabel.text
            label.font = UIFont.systemFont(ofSize: 25)
            label.textColor = .white
            return label
        }()
        
        let signStackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [operandOfSignLabel, operatorOfSignLabel])
            stackView.axis = .horizontal
            stackView.distribution = .fill
            stackView.alignment = .fill
            stackView.spacing = 8
            return stackView
        }()
        
        mathematicalExpressionStackView.addArrangedSubview(signStackView)
        print(mathematicalExpression + operandString)
        mathematicalExpression = ""
        operatorLabel.text = ""
        operandLabel.text = ""
        isOperandValueEmpty = false
        isCalculateCompleted = true
    }
}


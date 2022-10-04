//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    private enum Constant {
        static let zero = "0"
        static let doubleZero = "00"
        static let empty = ""
        static let dot = "."
    }
    
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    private var expression: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func numberButtonPressed(_ sender: UIButton) {
        guard let senderLabel = sender.titleLabel,
              let senderText = senderLabel.text
        else { return }
        updateOperandLabel(with: senderText)
    }
    
    @IBAction private func numberDoubleZeroButtonPressed(_ sender: UIButton) {
        if operandLabel.isZero {
            return
        }
        
        updateOperandLabel(with: Constant.doubleZero)
    }
    
    @IBAction private func operatorButtonPressed(_ sender: UIButton) {
        guard let senderLabel = sender.titleLabel,
              let senderText = senderLabel.text
        else { return }
        
        updateOperatorLabel(with: senderText)
        if operandLabel.isZero {
            return
        }
        addSubviewToStackView()
        updateExpression()
    }
    
    @IBAction func ACButtonPressed(_ sender: UIButton) {
        operatorLabel.text = Constant.empty
        operandLabel.text = Constant.zero
        expression = Constant.empty
    }
    
    
    private func updateOperandLabel(with number: String) {
        
        if operandLabel.isZero {
            operandLabel.text = number
        } else {
            if let operandText = operandLabel.text {
                operandLabel.text = operandText + number
            }
        }
    }
    
    private func fetchLabel(labelText :String) -> UILabel {
        let label = UILabel()
        label.text = labelText
        label.textColor = .white
        return label
    }
    
    private func fetchStackView(operatorLabel: UILabel, operandLabel: UILabel) -> UIStackView {
        let formulaStackView: UIStackView = .init(arrangedSubviews: [operatorLabel, operandLabel])
        formulaStackView.spacing = 8
        return formulaStackView
    }
    
    private func addSubviewToStackView() {
        guard let operandText = operandLabel.text,
              let operatorText = operatorLabel.text else { return }
        
        let operandLabel = fetchLabel(labelText: operandText)
        let operatorLabel = fetchLabel(labelText: operatorText)
        
        let subStackView = fetchStackView(operatorLabel: operatorLabel, operandLabel: operandLabel)
        stackView.addArrangedSubview(subStackView)
    }
    
    private func updateExpression() {
        
        guard let operandText = operandLabel.text,
              let operatorText = operatorLabel.text else { return }
        expression += operandText
        expression += operatorText
        
        resetOperandLabel()
    }
    
    private func updateOperatorLabel(with `operator`: String) {
        operatorLabel.text = `operator`
    }
    
    private func resetOperandLabel() {
        operandLabel.text = "0"
    }
}


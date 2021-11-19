//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var inputNumber = Number()
    var expression : String = ""
    @IBOutlet var inputNumberLabel: UILabel!
    @IBOutlet var inputOperatorLabel: UILabel!
    @IBOutlet var expressionStack: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputNumberLabel.text = inputNumber.value
    }
    
    @IBAction func touchNumberButton(_ sender: UIButton) {
        inputNumber.updateValue(with: sender.title(for: .normal)!)
        inputNumberLabel.text = inputNumber.value
    }
    
    @IBAction func touchCEbutton(_ sender: UIButton) {
        inputNumber.reset()
        inputNumberLabel.text = inputNumber.value
    }
    
    @IBAction func touchToggleSignButton(_ sender: UIButton) {
        inputNumber.toggleSign()
        inputNumberLabel.text = inputNumber.value
    }
    
    @IBAction func touchOperatorButton(_ sender: UIButton) {
        guard inputNumberLabel.text != "0" else {
            inputOperatorLabel.text = sender.title(for: .normal)
            return
        }
        let `operator` = sender.title(for: .normal)
        let operand = inputNumber.value
    
        let stackView = UIStackView()
        let operatorLabel = UILabel()
        if !stackView.arrangedSubviews.isEmpty {
            operatorLabel.text = ""
            expression += operand
        } else {
            operatorLabel.text = `operator`
            expression += `operator` ?? ""
            expression += operand
        }
        operatorLabel.textColor = .white
        let operandLabel = UILabel()
        operandLabel.text = operand
        operandLabel.textColor = .white
        stackView.addArrangedSubview(operatorLabel)
        stackView.addArrangedSubview(operandLabel)
        stackView.spacing = 5
        stackView.alignment = .bottom
        expressionStack.addArrangedSubview(stackView)
        inputNumberLabel.text = "0"
        inputNumber.reset()
    }
    
    @IBAction func touchEqualityButton(_ sender: UIButton) {
        if let `operator` = inputOperatorLabel.text {
            expression += `operator`
        }
        expression += inputNumber.value
        var formular = ExpressionParser.parse(from: expression)
        let result = formular.result()
        
        inputNumberLabel.text = inputNumber.formatter(result)
    }
}


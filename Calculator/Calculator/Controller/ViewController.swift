//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var zeroButton: UIButton!
    @IBOutlet private weak var doubleZeroButton: UIButton!
    @IBOutlet private weak var dotButton: UIButton!
    @IBOutlet private weak var oneButton: UIButton!
    @IBOutlet private weak var twoButton: UIButton!
    @IBOutlet private weak var threeButton: UIButton!
    @IBOutlet private weak var fourButton: UIButton!
    @IBOutlet private weak var fiveButton: UIButton!
    @IBOutlet private weak var sixButton: UIButton!
    @IBOutlet private weak var sevenButton: UIButton!
    @IBOutlet private weak var eightButton: UIButton!
    @IBOutlet private weak var nineButton: UIButton!
    
    
    @IBOutlet private weak var divideButton: UIButton!
    @IBOutlet private weak var multiplyButton: UIButton!
    @IBOutlet private weak var subtractButton: UIButton!
    @IBOutlet private weak var addButton: UIButton!
    
    @IBOutlet private weak var calculationHistoryStackView: UIStackView!
    @IBOutlet private weak var expression: UILabel!
    @IBOutlet private weak var arithmetic: UILabel!
    
    private var finalExpression: String = ""
    private var currentOperand: String = ""
    private var currentOperator: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.expression.text = "0"
        // Do any additional setup after loading the view.
    }

    @IBAction private func touchUpOperandButton(_ sender: UIButton) {
        guard let operand = sender.titleLabel?.text else {
            return
        }
                
        guard operand != "." || !currentOperand.contains(".") else {
            return
        }
        
        if operand == "." {
            currentOperand += currentOperand.isEmpty ? "0." : "."
            expression.text = currentOperand
            return
        } else {
            currentOperand += operand
        }
                
        currentOperand = currentOperand.replacingOccurrences(of: "^0+", with: "0", options: .regularExpression)
        
        guard let operandText = currentOperand.addCommaOnEveryThreeDigits() else {
            return
        }
        
        expression.text = operandText
    }
    
    @IBAction private func changePlusMinusSign(_ sender: Any) {
        guard let currentNumber = Double(currentOperand), !currentNumber.isZero else {
            return
        }
            
        if currentNumber.isSameAfterRounded() {
            currentOperand = String(Int(currentNumber) * -1)
        } else {
            currentOperand = String(currentNumber * -1)
        }
        
        expression.text = currentOperand
    }
    
    @IBAction private func touchUpOperatorButton(_ sender: UIButton) {
        guard let `operator` = matchOperatorButton(sender: sender) else {
            return
        }
    
        guard let currentNumber = Double(currentOperand), !currentNumber.isZero else {
            arithmetic.text = `operator`
            return
        }
        
        guard let operandText = String(currentNumber).addCommaOnEveryThreeDigits() else {
            return
        }
        
        addCalculationHistory(operandsText: operandText, operatorText: currentOperator)
        
        finalExpression += currentOperand
        finalExpression += " \(`operator`) "
        
        currentOperand = ""
        currentOperator = `operator`
        
        expression.text = "0"
        arithmetic.text = `operator`
    }
    
    @IBAction func touchUpEqualButton(_ sender: Any) {
        addCalculationHistory(operandsText: currentOperand, operatorText: currentOperator)
        
        finalExpression += currentOperand
        
        let formula = ExpressionParser.parse(from: finalExpression)
        
        do {
            let calculationResult = try formula.result()
            expression.text = calculationResult.description
            arithmetic.text = ""
        } catch OperationError.dividedByZero {
            expression.text = "NaN"
            arithmetic.text = ""
        } catch CalculationItemQueueError.hasNoElement {
            print(CalculationItemQueueError.hasNoElement.localizedDescription)
        } catch {
            print(error)
        }
    }
    
    @IBAction func touchUpACButton(_ sender: Any) {
        finalExpression = ""
        currentOperator = ""
        currentOperand = ""
        
        expression.text = "0"
        arithmetic.text = ""
        
        calculationHistoryStackView.arrangedSubviews.forEach { view in
            view.removeFromSuperview()
        }
    }
    
    private func matchOperatorButton(sender: UIButton) -> String? {
        switch sender {
        case addButton:
            return "+"
        case subtractButton:
            return "−"
        case divideButton:
            return "÷"
        case multiplyButton:
            return "×"
        default:
            return nil
        }
    }
    
    private func addCalculationHistory(operandsText: String, operatorText: String) {
        let sign = UILabel()
        sign.textColor = .white
        sign.text = operatorText
        sign.font = UIFont(name: "Helvetica", size: 24)
        
        let history = UILabel()
        history.text = operandsText
        history.textColor = .white
        history.font = UIFont(name: "Helvetica", size: 24)
        
        let newHistoryStackView = UIStackView(arrangedSubviews: [sign, history])
        
        newHistoryStackView.axis = .horizontal
        newHistoryStackView.spacing = 10
        
        calculationHistoryStackView.addArrangedSubview(newHistoryStackView)
        
        newHistoryStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newHistoryStackView.trailingAnchor.constraint(equalTo: calculationHistoryStackView.trailingAnchor, constant: 10.0)
        ])
    }
}


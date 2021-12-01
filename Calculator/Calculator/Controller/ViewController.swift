//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var inputNumber = CalculatorManager()
    var expression : String = ""
    var isCalculated = false
    @IBOutlet var inputNumberLabel: UILabel!
    @IBOutlet var inputOperatorLabel: UILabel!
    @IBOutlet var expressionHistoryStack: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputNumberLabel.text = inputNumber.value
        inputOperatorLabel.text = ""
    }
    
    private func addExpressionHistoryStack(operator: String, operand: String) {
        let operatorExpression = ExpressionLabel(text: `operator`)
        let opernadExpression = ExpressionLabel(text: operand)
        let expressionStackView = ExpressionStackView(arrangedSubviews: [operatorExpression, opernadExpression])
        expressionHistoryStack.addArrangedSubview(expressionStackView)
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
        
        if isCalculated == true {
            isCalculated = false
        }
        
        let operand = inputNumber.value
        guard let currentOperator = inputOperatorLabel.text else {
            return
        }
        guard let touchingOperator = sender.title(for: .normal) else {
            return
        }
        
        if expression.isEmpty {
            expression += operand
            addExpressionHistoryStack(operator: "", operand: operand)
            inputNumber.reset()
            inputNumberLabel.text = inputNumber.value
            inputOperatorLabel.text = touchingOperator
            return
        }

        addExpressionHistoryStack(operator: currentOperator, operand: operand)
        inputNumber.reset()
        inputNumberLabel.text = inputNumber.value
        inputOperatorLabel.text = touchingOperator
    }
    
    @IBAction func touchEqualityButton(_ sender: UIButton) {
        guard isCalculated == false else {
            return
        }
        
        let operand = inputNumber.value
        guard let currentOperator = inputOperatorLabel.text else {
            return
        }
        expression += currentOperator
        expression += inputNumber.value
        addExpressionHistoryStack(operator: currentOperator, operand: operand)
        inputOperatorLabel.text = ""
        var formular = ExpressionParser.parse(from: expression)
        do {
            let result = try formular.result()
            inputNumberLabel.text = inputNumber.textualRepresentation(with: result)
            isCalculated = true
        } catch CalculatorError.divideByZero {
            inputNumberLabel.text = "NaN"
        } catch CalculatorError.emptyCalculatorItemQueue {
            print("연산 할 연산자 또는 피연산자가 없습니다.")
        } catch {
            print("알 수 없는 오류가 발생했습니다.")
        }
        
    }
}


//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var historyStackView: UIStackView!
    @IBOutlet private weak var historyScrollView: UIScrollView!
    let calculator: Calculator = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearAll()
    }
    
    private func updateOperatorLabel(to string: String = "") {
        operatorLabel.text = string
    }
    
    private func updateNumberLabel(to string: String = "0") {
        numberLabel.text = string
    }
    
    private func removeAllStackView() {
        historyStackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    private func inputNumber(_ number: String) {
        let currentOperand = calculator.currentOperand + number
        
        calculator.updateCurrentOperand(currentOperand)
        updateNumberLabel(to: calculator.currentOperand)
    }
    
    private func inputDot() {
        if calculator.isDecimal {
            return
        }
        if calculator.isOperandEmpty {
            calculator.updateCurrentOperand("0")
        }
        
        let currentOperand = calculator.currentOperand + MathSymbol.dot
        
        calculator.updateCurrentOperand(currentOperand)
        updateNumberLabel(to: calculator.currentOperand)
    }
    
    private func inputOperator(_ `operator`: String) {
        calculator.updateExpression()
        addHistoryStackView()
        clearEntry()
        calculator.updateCurrentOperator(`operator`)
        updateOperatorLabel(to: calculator.currentOperator)
    }
    
    private func clearAll() {
        calculator.clearCalculator()
        updateOperatorLabel(to: calculator.currentOperator)
        updateNumberLabel(to: calculator.currentOperand)
        removeAllStackView()
    }
    
    private func clearEntry() {
        calculator.updateCurrentOperand("")
        updateNumberLabel(to: calculator.currentOperand)
    }
    
    private func changeSign() {
        var currentOperand = calculator.currentOperand
        if calculator.isNegativeOperand {
           currentOperand = String(currentOperand.dropFirst())
        } else {
            currentOperand = "−" + currentOperand
        }
        
        calculator.updateCurrentOperand(currentOperand)
        updateNumberLabel(to: calculator.currentOperand)
    }
    
    private func inputEqual() {
        calculator.updateExpression()
        addHistoryStackView()
    }

    private func showResult() {
        let result: String
        do {
            result = String(try calculator.calculatedResult())
        } catch CalculatorError.queueIsEmpty {
            result = CalculatorError.queueIsEmpty.description
        } catch CalculatorError.divisionByZero {
            result = CalculatorError.divisionByZero.description
        } catch {
            result = CalculatorError.unknown.description
        }
        updateOperatorLabel(to: calculator.currentOperator)
        updateNumberLabel(to: result)
    }
    
    private func makeLabel(_ text: String) -> UILabel {
        let label: UILabel = UILabel()
        label.text = text
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        return label
    }
    
    private func addHistoryStackView() {
        let newStackView: UIStackView = UIStackView()
        let signLabel: UILabel = makeLabel(calculator.currentOperator)
        let numberLabel: UILabel = makeLabel(calculator.currentOperand)
        
        newStackView.addArrangedSubview(signLabel)
        newStackView.addArrangedSubview(numberLabel)
        
        historyStackView.addArrangedSubview(newStackView)
    }
    
    @IBAction func touchCalculatorButton(_ sender: UIButton) {
        guard let key: CalculatorKeypad = CalculatorKeypad(rawValue: sender.currentTitle ?? "") else {
            return
        }
        
        switch key {
        case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .zero, .doubleZero:
            inputNumber(key.rawValue)
        case .dot:
            inputDot()
        case .add, .subtract, .multiply, .divide:
            inputOperator(key.rawValue)
        case .ac:
            clearAll()
        case .ce:
            clearEntry()
        case .plusMinus:
            changeSign()
        case .equal:
            inputEqual()
            showResult()
        }
    }
}


//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet private weak var currentNumberLabel: UILabel!
    @IBOutlet private weak var currentOperatorLabel: UILabel!
    
    @IBOutlet private weak var receivedInputsScrollView: UIScrollView!
    @IBOutlet private weak var receivedInputsStackView: UIStackView!
    
    @IBAction func pressDotButton(_ sender: UIButton) {
        guard firstDecimalPointInCurrentNumber else { return }
        firstDecimalPointInCurrentNumber = false
        
        currentNumber += CalculatorExceptionCase.dot
        refreshNumberLabel()
    }
    
    private var currentNumber: String = CalculatorExceptionCase.zero
    private var currentOperator: String = CalculatorExceptionCase.emptyString
    private var snippets: [(`operator`: String, operand: String)] = []
    private var firstDecimalPointInCurrentNumber = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshNumberLabel()
        refreshOperatorLabel()
    }
}

// MARK: - UI 갱신을 위한 메서드
extension CalculatorViewController {
    private func refreshNumberLabel() {
        let newNumber = currentNumber.formatAsNumber()
        
        DispatchQueue.main.async {
            self.currentNumberLabel.text = newNumber
        }
    }
    
    private func refreshOperatorLabel() {
        DispatchQueue.main.async {
            self.currentOperatorLabel.text = self.currentOperator
        }
    }
    
    private func insertIndividualStackView(with operatorData: String, and operandData: String) {
        let operatorLabel: UILabel = {
            let label = UILabel()
            label.textColor = .white
            label.text = operatorData
            return label
        }()
        let operandLabel: UILabel = {
            let label = UILabel()
            label.textColor = .white
            label.text = operandData
            return label
        }()
        
        let individualStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.addArrangedSubview(operatorLabel)
            stackView.addArrangedSubview(operandLabel)
            stackView.axis = .horizontal
            stackView.alignment = .fill
            stackView.spacing = 8
            return stackView
        }()
        
        DispatchQueue.main.async {
            self.receivedInputsStackView.addArrangedSubview(individualStackView)
        }
    }
    
    private func clearStackView() {
        DispatchQueue.main.async {
            self.receivedInputsStackView.subviews.forEach {
                $0.removeFromSuperview()
            }
        }
    }
}

// MARK: - 내부 기능 구현을 위한 메서드
extension CalculatorViewController {
    private func translateOperator(_ symbol: String) -> String {
        switch symbol {
        case "+":
            return "+"
        case "–":
            return "–"
        case "×":
            return "*"
        case "÷":
            return "/"
        default:
            return CalculatorExceptionCase.emptyString
        }
    }
}

// MARK: - 각 버튼을 눌렀을 때의 동작을 위한 메서드
extension CalculatorViewController {
    @IBAction private func pressNumberButton(_ sender: UIButton) {
        if snippets.isNotEmpty && currentOperator.isEmpty {
            return
        }
        
        guard let number = sender.titleLabel?.text else {
            return
        }
        
        switch currentNumber {
        case CalculatorExceptionCase.nan,
            CalculatorExceptionCase.error:
            return
        case CalculatorExceptionCase.zero:
            currentNumber = number
        default:
            currentNumber += number
        }
        
        refreshNumberLabel()
    }
    
    
    
    @IBAction private func pressOperatorButton(_ sender: UIButton) {
        guard let `operator` = sender.titleLabel?.text else {
            return
        }
        
        switch currentNumber {
        case CalculatorExceptionCase.zero:
            if snippets.isNotEmpty {
                currentOperator = `operator`
            }
        case CalculatorExceptionCase.nan, CalculatorExceptionCase.error:
            return
        default:
            let operatorNow = translateOperator(currentOperator)
            snippets.append((operatorNow, currentNumber))
            insertIndividualStackView(with: currentOperator, and: currentNumber)
            currentOperator = `operator`
            currentNumber = CalculatorExceptionCase.zero
        }
        
        refreshNumberLabel()
        refreshOperatorLabel()
        receivedInputsScrollView.scrollDownToBottom()
        firstDecimalPointInCurrentNumber = true
    }
    
    @IBAction private func pressEqualButton(_ sender: UIButton) {
        guard currentNumber != CalculatorExceptionCase.nan,
              currentNumber != CalculatorExceptionCase.error,
              currentOperator.isNotEmpty else {
            return
        }
        
        let operatorNow = translateOperator(currentOperator)
        snippets.append((operatorNow, currentNumber))
        insertIndividualStackView(with: currentOperator, and: currentNumber)
        
        var totalString = CalculatorExceptionCase.emptyString
        snippets.forEach {
            totalString += $0.`operator`
            totalString += $0.operand
        }
        
        let formula = ExpressionParser.parse(from: totalString)
        
        do {
            let result = try formula.result()
            currentNumber = String(result)
        } catch CalculatorError.dividedByZero {
            currentNumber = CalculatorExceptionCase.nan
        } catch {
            currentNumber = CalculatorExceptionCase.error
        }
        currentOperator = CalculatorExceptionCase.emptyString
        firstDecimalPointInCurrentNumber = true
        
        refreshNumberLabel()
        refreshOperatorLabel()
        receivedInputsScrollView.scrollDownToBottom()
    }
    
    @IBAction private func pressCEButton(_ sender: UIButton) {
        guard currentNumber != CalculatorExceptionCase.nan,
              currentNumber != CalculatorExceptionCase.error else {
            return
        }
        
        currentNumber = CalculatorExceptionCase.zero
        if currentOperator == CalculatorExceptionCase.emptyString {
            snippets.removeAll()
            clearStackView()
        }
        
        firstDecimalPointInCurrentNumber = true
        refreshNumberLabel()
    }
    
    @IBAction private func pressACButton(_ sender: UIButton) {
        snippets.removeAll()
        currentNumber = CalculatorExceptionCase.zero
        currentOperator = CalculatorExceptionCase.emptyString
        firstDecimalPointInCurrentNumber = true
        
        refreshNumberLabel()
        refreshOperatorLabel()
        clearStackView()
    }
    
    @IBAction private func pressInvertButton(_ sender: UIButton) {
        guard currentNumber != CalculatorExceptionCase.zero else {
            return
        }
        
        currentNumber = CalculatorExceptionCase.minus + currentNumber
        
        refreshNumberLabel()
    }
}


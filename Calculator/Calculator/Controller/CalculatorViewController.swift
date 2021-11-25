//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet private weak var calculationHistoryScrollView: UIScrollView!
    @IBOutlet private weak var calculationHistoryStackView: UIStackView!
    @IBOutlet private weak var operandLabel: UILabel!
    @IBOutlet private weak var operatorLabel: UILabel!
    
    private var calculatorManager = CalculatorManager()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        resetCurrentOperand()
    }

    // MARK: - Private Methods
    private func resetToInitialState() {
        calculatorManager.reset()
        operatorLabel.text = calculatorManager.currentOperator
        
        resetCurrentOperand()
        
        calculationHistoryStackView.arrangedSubviews.forEach { view in
            view.removeFromSuperview()
        }
    }

    private func resetCurrentOperand() {
        calculatorManager.resetOperand()
        operandLabel.text = calculatorManager.currentOperand
    }
    
    private func changeOperator(to newOperator: String) {
        let operatorSymbols = Operator.allCases.map { $0.rawValue }
        
        guard let last = mathExpression.last else {
            return
        }
        
        if operatorSymbols.contains(last) {
            mathExpression.removeLast()
        }
        
        mathExpression.append(newOperator)
        operatorLabel.text = newOperator
        currentOperator = newOperator
    }
    
    private func addLastCalculationHistory() {
        guard !currentOperand.isEmpty && !currentOperator.isEmpty else {
            return
        }
        
        guard let currentOperandText = currentOperand.addCommaOnEveryThreeDigits() else {
            return
        }
        
        guard let currentOperandNumber = Double(currentOperand) else {
            return
        }
        
        mathExpression.append(currentOperand)
        
        if isNumberOverMaximumExpression(number: currentOperandNumber) {
            addCalculationHistory(operandText: currentOperandNumber.description, operatorText: currentOperator)
        } else {
            addCalculationHistory(operandText: currentOperandText, operatorText: currentOperator)
        }
    }
    
    private func calculateFormula(from expression: String) {
        let formula = ExpressionParser.parse(from: expression)
        
        do {
            let calculationResult = try formula.result()
            guard let calculationResultFormatted = calculationResult.description.addCommaOnEveryThreeDigits() else {
                return
            }
            
            operatorLabel.text = ""
            
            if isNumberOverMaximumExpression(number: calculationResult) {
                operandLabel.text = calculationResult.description
            } else {
                operandLabel.text = calculationResultFormatted
            }
        } catch OperationError.dividedByZero {
            operandLabel.text = "NaN"
            operatorLabel.text = ""
        } catch CalculationItemQueueError.hasNoElement {
            print(CalculationItemQueueError.hasNoElement.localizedDescription)
        } catch {
            print(error)
        }
    }
    
    private func addCalculationHistory(operandText: String, operatorText: String) {
        let selectedOperatorLabel = ExpressionLabel(text: operatorText)
        let selectedOperandLabel = ExpressionLabel(text: operandText)        
        
        let newHistoryStackView = HistoryStackView(arrangedSubviews: [selectedOperatorLabel, selectedOperandLabel])
        
        calculationHistoryStackView.addArrangedSubview(newHistoryStackView)
        
        autoScrollToBottom()
    }
    
    private func autoScrollToBottom() {
        calculationHistoryScrollView.layoutIfNeeded()
        
        let bottomOffset = CGPoint(x: 0, y: calculationHistoryScrollView.contentSize.height - calculationHistoryScrollView.bounds.height + calculationHistoryScrollView.contentInset.bottom)
        
        if bottomOffset.y > 0 {
            calculationHistoryScrollView.setContentOffset(bottomOffset, animated: true)
        }
    }
}

// MARK: - IBAction Methods
extension CalculatorViewController {
    @IBAction private func touchUpOperandButton(_ sender: UIButton) {
        if calculatorManager.isCalculated {
            resetToInitialState()
        }
        
        guard let operand = sender.titleLabel?.text else {
            return
        }
                 
        calculatorManager.fetchOperand(input: operand)
        
        guard let currentOperandDouble = calculatorManager.currentOperandToDouble() else {
            return
        }
        
        if calculatorManager.isNumberOverMaximumExpression(number: currentOperandDouble) {
            operandLabel.text = currentOperandDouble.description
            return
        }
        
        let separatedCurrentOperand = calculatorManager.splitWithIntegerAndFraction(from: calculatorManager.currentOperand)
        
        guard let operandText = calculatorManager.addCommaOnEveryThreeDigits(to: separatedCurrentOperand.integer) else {
            return
        }
                
        if separatedCurrentOperand.fraction.isEmpty {
            operandLabel.text = operandText
        } else {
            operandLabel.text = operandText + "." + separatedCurrentOperand.fraction
        }
    }
    
    @IBAction private func touchUpDotButton(_ sender: UIButton) {
        guard let dot = sender.titleLabel?.text else {
            return
        }
        
        guard !currentOperand.contains(dot) else {
            return
        }
        
        currentOperand += dot
        operandLabel.text?.append(dot)
    }
    
    @IBAction private func touchUpChangePlusMinusSign(_ sender: Any) {
        guard let currentOperandNumber = Double(currentOperand), !currentOperandNumber.isZero else {
            return
        }
        
        guard var operand = operandLabel.text else {
            return
        }
        
        if operand.contains("-") {
            operand.removeFirst()
        } else {
            operand = "-" + operand
        }
        
        operandLabel.text = operand
                
        guard isNumberOverMaximumExpression(number: currentOperandNumber) else {
            currentOperand = operand.replacingOccurrences(of: ",", with: "")
            return
        }
        
        if currentOperand.contains("-") {
            currentOperand.removeFirst()
        } else {
            currentOperand = "-" + currentOperand
        }
    }
    
    @IBAction private func touchUpOperatorButton(_ sender: UIButton) {
        guard operandLabel.text != "NaN" else {
            return
        }
        
        if isCalculated {
            resetCurrentOperand()
            isCalculated = false
        }
        
        guard let `operator` = sender.titleLabel?.text else {
            return
        }
    
        guard let currentOperandNumber = Double(currentOperand), !currentOperandNumber.isZero else {
            changeOperator(to: `operator`)
            return
        }
        
        guard let operandText = currentOperand.addCommaOnEveryThreeDigits() else {
            return
        }
        
        if isNumberOverMaximumExpression(number: currentOperandNumber) {
            addCalculationHistory(operandText: currentOperandNumber.description, operatorText: currentOperator)
        } else {
            addCalculationHistory(operandText: operandText, operatorText: currentOperator)
        }
        
        mathExpression.append(currentOperand)
        mathExpression.append(`operator`)
        
        changeOperator(to: `operator`)        
        resetCurrentOperand()
    }
    
    @IBAction private func touchUpEqualButton(_ sender: Any) {
        guard !isCalculated else {
            return
        }
        
        isCalculated = true
        
        addLastCalculationHistory()
        calculateFormula(from: mathExpression)
    }
    
    @IBAction private func touchUpACButton(_ sender: Any) {
        resetToInitialState()
    }
    
    @IBAction private func touchUpCEButton(_ sender: Any) {
        guard !isCalculated else {
            resetToInitialState()
            return
        }
        
        resetCurrentOperand()
    }
}

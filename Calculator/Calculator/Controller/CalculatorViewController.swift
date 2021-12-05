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
        calculatorManager.resetCurrentOperand()
        operandLabel.text = calculatorManager.currentOperand
    }
    
    private func changeOperator(with newOperator: String) {
        let operatorMarks = Operator.marks
        
        guard let last = calculatorManager.expression.last else {
            return
        }
        
        if operatorMarks.contains(last) {
            calculatorManager.removeLastExpression()
        }
        
        calculatorManager.fetchExpression(operand: "", operator: newOperator)
        operatorLabel.text = newOperator
        calculatorManager.fetchOperator(with: newOperator)
    }
    
    private func addLastCalculationHistory() {
        guard !calculatorManager.currentOperand.isEmpty && !calculatorManager.currentOperator.isEmpty else {
            return
        }
        
        guard let currentOperandText = calculatorManager.addCommaOnEveryThreeDigits(to: calculatorManager.currentOperand) else {
            return
        }
        
        guard let currentOperandDouble = Double(calculatorManager.currentOperand) else {
            return
        }
        
        calculatorManager.fetchExpression(operand: calculatorManager.currentOperand, operator: "")
        
        if calculatorManager.isNumberOverMaximumExpression(number: currentOperandDouble) {
            addCalculationHistory(operandText: currentOperandDouble.description, operatorText: calculatorManager.currentOperator)
        } else {
            addCalculationHistory(operandText: currentOperandText, operatorText: calculatorManager.currentOperator)
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
                 
        calculatorManager.fetchOperand(with: operand)
        
        guard let currentOperandDouble = Double(calculatorManager.currentOperand) else {
            return
        }
        
        if calculatorManager.isNumberOverMaximumExpression(number: currentOperandDouble) {
            operandLabel.text = currentOperandDouble.description
            return
        }
        
        let separatedCurrentOperand = calculatorManager.splitToIntegerAndFraction(from: calculatorManager.currentOperand)
        
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
        
        guard !calculatorManager.isOperandContainsDot else {
            return
        }
        
        calculatorManager.fetchOperand(with: dot)
        operandLabel.text?.append(dot)
    }
    
    @IBAction private func touchUpChangePlusMinusSign(_ sender: UIButton) {
        guard let currentOperandDouble = Double(calculatorManager.currentOperand), !currentOperandDouble.isZero else {
            return
        }
        
        guard var operand = operandLabel.text else {
            return
        }
        
        calculatorManager.toggleOperandSign(from: &operand)
        
        operandLabel.text = operand
    }
    
    @IBAction private func touchUpOperatorButton(_ sender: UIButton) {
        guard operandLabel.text != "NaN" else {
            return
        }
        
        if calculatorManager.isCalculated {
            resetCurrentOperand()
            calculatorManager.resetIsCalculated()
        }
        
        guard let `operator` = sender.titleLabel?.text else {
            return
        }
    
        guard let currentOperandDouble = Double(calculatorManager.currentOperand), !currentOperandDouble.isZero else {
            changeOperator(with: `operator`)
            return
        }
        
        guard let operandText = calculatorManager.addCommaOnEveryThreeDigits(to: calculatorManager.currentOperand) else {
            return
        }
        
        if calculatorManager.isNumberOverMaximumExpression(number: currentOperandDouble) {
            addCalculationHistory(operandText: currentOperandDouble.description, operatorText: calculatorManager.currentOperator)
        } else {
            addCalculationHistory(operandText: operandText, operatorText: calculatorManager.currentOperator)
        }
                
        calculatorManager.fetchExpression(operand: calculatorManager.currentOperand, operator: calculatorManager.currentOperator)
        
        changeOperator(with: `operator`)
        resetCurrentOperand()
    }
    
    @IBAction private func touchUpEqualButton(_ sender: UIButton) {
        guard !calculatorManager.isCalculated else {
            return
        }
        
        addLastCalculationHistory()
        
        do {
            let calculationResult = try calculatorManager.calculate()
            guard let formattedCalculationResult = calculatorManager.addCommaOnEveryThreeDigits(to: calculationResult.description) else {
                return
            }
            
            operatorLabel.text = ""
            
            if calculatorManager.isNumberOverMaximumExpression(number: calculationResult) {
                operandLabel.text = calculationResult.description
            } else {
                operandLabel.text = formattedCalculationResult
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
    
    @IBAction private func touchUpACButton(_ sender: UIButton) {
        resetToInitialState()
    }
    
    @IBAction private func touchUpCEButton(_ sender: UIButton) {
        resetCurrentOperand()
    }
}

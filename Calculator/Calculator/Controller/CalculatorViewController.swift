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
    
    private func addLastCalculationHistory() {
        guard !calculatorManager.currentOperand.isEmpty && !calculatorManager.currentOperator.isEmpty else {
            return
        }
        
        guard let currentOperandText = calculatorManager.addCommaOnEveryThreeDigits(to: calculatorManager.currentOperand) else {
            return
        }
        
        guard let currentOperandDouble = calculatorManager.currentOperandToDouble() else {
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
        
        guard !calculatorManager.isOperandContainsDot else {
            return
        }
        
        calculatorManager.fetchOperand(input: dot)
        operandLabel.text?.append(dot)
    }
    
    @IBAction private func touchUpChangePlusMinusSign(_ sender: Any) {
        guard let currentOperandDouble = calculatorManager.currentOperandToDouble(), !currentOperandDouble.isZero else {
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
    
        guard let currentOperandDouble = calculatorManager.currentOperandToDouble(), !currentOperandDouble.isZero else {
            operatorLabel.text = `operator`
            calculatorManager.fetchOperator(with: `operator`)
            return
        }
        
        guard let operandText = calculatorManager.addCommaOnEveryThreeDigits(to: calculatorManager.currentOperand) else {
            return
        }
        
        guard !calculatorManager.expression.isEmpty else {
            addCalculationHistory(operandText: operandText, operatorText: "")
            calculatorManager.fetchExpression(operand: calculatorManager.currentOperand, operator: "")
            return
        }
        
        if calculatorManager.isNumberOverMaximumExpression(number: currentOperandDouble) {
            addCalculationHistory(operandText: currentOperandDouble.description, operatorText: calculatorManager.currentOperator)
        } else {
            addCalculationHistory(operandText: operandText, operatorText: calculatorManager.currentOperator)
        }
                
        calculatorManager.fetchExpression(operand: calculatorManager.currentOperand, operator: calculatorManager.currentOperator)
        
        calculatorManager.fetchOperator(with: `operator`)
        operatorLabel.text = `operator`
        resetCurrentOperand()
    }
    
    @IBAction private func touchUpEqualButton(_ sender: Any) {
        guard !calculatorManager.isCalculated else {
            return
        }
        
        addLastCalculationHistory()
        
        do {
            let calculationResult = try calculatorManager.doCalculate()
            guard let calculationResultFormatted = calculatorManager.addCommaOnEveryThreeDigits(to: calculationResult.description) else {
                return
            }
            
            operatorLabel.text = ""
            
            if calculatorManager.isNumberOverMaximumExpression(number: calculationResult) {
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
    
    @IBAction private func touchUpACButton(_ sender: Any) {
        resetToInitialState()
    }
    
    @IBAction private func touchUpCEButton(_ sender: Any) {
        resetCurrentOperand()
    }
}

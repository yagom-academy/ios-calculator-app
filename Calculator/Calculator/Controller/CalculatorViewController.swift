//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class CalculatorViewController: UIViewController {
    @IBOutlet private weak var operandLabel: UILabel!
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var formulaStackView: UIStackView!
    @IBOutlet private weak var logScrollView: UIScrollView!
    
    private var operand: String = CalculatorConstant.blank
    private var arithmeticOperator: String = CalculatorConstant.blank
    private var finalFormula: String = CalculatorConstant.blank
    private var isDotButtonTapped: Bool = false
    private var isFirstInput: Bool = true
    private var isCalculated: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetOperandLabel()
        resetOperatorLabel()
    }
    
    @IBAction private func operandButtonTapped(_ sender: UIButton) {
        guard !isCalculated else {
            return
        }
        
        switch sender.tag {
        case 0 where !operand.isEmpty:
            updateOperandLabel(with: sender.tag.description)
        case 1...9:
            updateOperandLabel(with: sender.tag.description)
        case 10 where !operand.isEmpty:
            updateOperandLabel(with: CalculatorConstant.doubleZero)
        case 11 where !isDotButtonTapped:
            updateOperandLabel(with: CalculatorConstant.dot)
            isDotButtonTapped = true
        default:
            return
        }
        
        isFirstInput = false
    }
    
    @IBAction private func operatorButtonTapped(_ sender: UIButton) {
        guard let selectedOperator = sender.currentTitle,
              !isFirstInput
        else {
            return
        }
        
        if isCalculated {
            finalFormula.removeAll()
        }
        
        if !operand.isEmpty {
            createFormulaLog()
        }
        
        updateOperatorLabel(with: selectedOperator)
        isCalculated = false
    }
    
    @IBAction private func calculateButtonTapped(_ sender: UIButton) {
        guard !isCalculated else {
            return
        }
        
        if operand.isEmpty {
            operand += CalculatorConstant.zero
        }
        
        createFormulaLog()
        calculate()
        resetOperatorLabel()
        isCalculated = true
    }
    
    @IBAction private func allClearButtonTapped(_ sender: UIButton) {
        resetOperandLabel()
        resetOperatorLabel()
        formulaStackView.removeAllSubViews()
        
        isFirstInput = true
        isDotButtonTapped = false
        isCalculated = false
        
        finalFormula.removeAll()
    }
    
    @IBAction private func clearEntryButtonTapped(_ sender: UIButton) {
        if !operand.isEmpty {
            resetOperandLabel()
            isCalculated = false
            isDotButtonTapped = false
        }
        
        if finalFormula.isEmpty {
            isFirstInput = true
        }
    }
    
    @IBAction private func toggleSignButtonTapped(_ sender: UIButton) {
        guard !isCalculated, !operand.isEmpty else {
            return
        }

        if operand.starts(with: CalculatorConstant.negativeSign) {
            operand.removeFirst()
            updateOperandLabel(with: CalculatorConstant.blank)
        } else {
            updateOperandLabel(with: CalculatorConstant.negativeSign)
        }
    }

    private func createStackView() {
        let numberFormatter = NumberFormatter()
        let logOperand = operand.formatStyleToDecimal(numberFormatter)
        let stackView = LogStackView(operand: logOperand, arithmeticOperator: arithmeticOperator)

        formulaStackView.addArrangedSubview(stackView)
        updateLogScrollViewContentOffset()
    }

    private func removeLastDot() {
        operand = operand.trimmingCharacters(in: CalculatorConstant.dotSet)
    }

    private func createFinalFormula() {
        finalFormula += arithmeticOperator
        finalFormula += operand
    }

    private func updateOperandLabel(with input: String) {
        let numberFormatter = NumberFormatter()
        if input == CalculatorConstant.dot {
            if isFirstInput {
                operand += CalculatorConstant.zero + input
                operandLabel.text = operand

                return
            }
            operand += input
            operandLabel.text = operand.formatStyleToDecimal(numberFormatter) + CalculatorConstant.dot

            return
        } else if input == CalculatorConstant.negativeSign {
            operand = input + operand
        } else {
            operand += input
        }

        if isDotButtonTapped {
            let (integerPart, decimalPart) = operand.splitByDot()

            operandLabel.text = integerPart.formatStyleToDecimal(numberFormatter) + CalculatorConstant.dot + decimalPart
        } else {
            operandLabel.text = operand.formatStyleToDecimal(numberFormatter)
        }
    }
    
    private func updateOperatorLabel(with input: String) {
        arithmeticOperator = input
        operatorLabel.text = arithmeticOperator
    }

    private func resetOperandLabel() {
        operand.removeAll()
        operandLabel.text = CalculatorConstant.zero
    }
    
    private func resetOperatorLabel() {
        arithmeticOperator.removeAll()
        operatorLabel.text = CalculatorConstant.blank
    }
    
    private func createFormulaLog() {
        removeLastDot()
        createStackView()
        createFinalFormula()
        resetOperandLabel()
        isDotButtonTapped = false
    }
    
    private func calculate() {
        isCalculated = true
        var formula = ExpressionParser.parse(from: finalFormula)
        
        do {
            let result = try formula.result()
            
            updateOperandLabel(with: String(result))
        } catch CalculatorError.divideWithZero {
            operandLabel.text = CalculatorConstant.notNumber
        } catch {
            operandLabel.text = CalculatorConstant.unexpectedError
        }
    }
    
    private func updateLogScrollViewContentOffset() {
        logScrollView.layoutIfNeeded()
        let contentOffset = CGPoint(
            x: 0,
            y: logScrollView.contentSize.height - logScrollView.bounds.height
        )
        logScrollView.setContentOffset(contentOffset, animated: true)
    }
}


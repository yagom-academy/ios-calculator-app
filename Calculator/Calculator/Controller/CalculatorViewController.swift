//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class CalculatorViewController: UIViewController {
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var formulaStackView: UIStackView!
    @IBOutlet weak var logScrollView: UIScrollView!
    
    private var operand: String = CalculatorConstant.blank
    private var arithmeticOperator: String = CalculatorConstant.blank
    private var finalFormula: String = CalculatorConstant.blank
    private var isDotButtonTapped: Bool = false
    private var isFirstInput: Bool = true
    private var isCalculated: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setOperandLabelToZero()
        setOperatorLabelEmpty()
    }
    
    @IBAction func operandButtonTapped(_ sender: UIButton) {
        guard !isCalculated else { return }
        
        switch sender.tag {
        case 0:
            guard !operand.isEmpty else { return }
            
            updateOperandLabel(with: sender.tag.description)
        case 1...9:
            updateOperandLabel(with: sender.tag.description)
        case 10:
            guard !operand.isEmpty else { return }
            
            updateOperandLabel(with: CalculatorConstant.doubleZero)
        case 11:
            guard !isDotButtonTapped else { return }
            
            updateOperandLabel(with: CalculatorConstant.dot)
            isDotButtonTapped = true
        default:
            return
        }
        
        isFirstInput = false
    }
    
    @IBAction func operatorButtonTapped(_ sender: UIButton) {
        guard let selectedOperator = sender.currentTitle else { return }
        guard !isFirstInput else { return }
        
        if isCalculated {
            finalFormula.removeAll()
        }
        
        if !operand.isEmpty {
            createFormulaLog()
        }
        
        updateOperatorLabel(with: selectedOperator)
        isCalculated = false
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        guard !isCalculated else { return }
        
        if operand.isEmpty {
            operand += CalculatorConstant.zero
        }
        
        createFormulaLog()
        calculate()
        setOperatorLabelEmpty()
        arithmeticOperator.removeAll()
        isCalculated = true
    }
    
    @IBAction func allClearButtonTapped(_ sender: UIButton) {
        setOperandLabelToZero()
        setOperatorLabelEmpty()
        removeAllLogStackView()
        
        isFirstInput = true
        isDotButtonTapped = false
        isCalculated = false
        
        operand.removeAll()
        arithmeticOperator.removeAll()
        finalFormula.removeAll()
    }
    
    @IBAction func clearEntryButtonTapped(_ sender: UIButton) {
        if !operand.isEmpty {
            operand.removeAll()
            setOperandLabelToZero()
            isCalculated = false
        }
        
        if finalFormula.isEmpty {
            isFirstInput = true
        }
    }
    
    @IBAction func toggleSignButtonTapped(_ sender: UIButton) {
        guard !isCalculated else { return }
        guard !operand.isEmpty else{ return }
        
        if operand.starts(with: CalculatorConstant.negativeSign) {
            operand.removeFirst()
        } else {
            operand = CalculatorConstant.negativeSign + operand
        }

        operandLabel.text = operand
    }
    
    func createStackView() {
        let logOperand = operand.formatStyleToDecimal()
        let stackView = LogStackView(operand: logOperand, arithmeticOperator: arithmeticOperator)
        
        formulaStackView.addArrangedSubview(stackView)
        updateLogScrollViewContentOffset()
    }
    
    func removeLastDot() {
        operand = operand.trimmingCharacters(in: CalculatorConstant.dotSet)
    }
    
    func createFinalFormula() {
        finalFormula += arithmeticOperator
        finalFormula += operand
    }
    
    func updateOperandLabel(with input: String) {
        if input == CalculatorConstant.dot {
            if isFirstInput {
                operand += CalculatorConstant.zero + input
                operandLabel.text = operand
                
                return
            }
            operand += input
            operandLabel.text = operand
        } else {
            operand += input
            operandLabel.text = operand.formatStyleToDecimal()
        }
    }
    
    func updateOperatorLabel(with input: String) {
        arithmeticOperator = input
        operatorLabel.text = arithmeticOperator
    }

    func setOperandLabelToZero() {
        operandLabel.text = CalculatorConstant.zero
    }
    
    func setOperatorLabelEmpty() {
        operatorLabel.text = CalculatorConstant.blank
    }
    
    func createFormulaLog() {
        removeLastDot()
        createStackView()
        setOperandLabelToZero()
        createFinalFormula()
        operand.removeAll()
        isDotButtonTapped = false
    }
    
    func calculate() {
        isCalculated = true
        var formula = ExpressionParser.parse(from: finalFormula)
        
        do {
            guard let result = try formula.result() else { return }
            
            updateOperandLabel(with: String(result))
        } catch CalculatorError.divideWithZero {
            operandLabel.text = CalculatorConstant.notNumber
        } catch {
            print(error)
        }
    }
    
    func updateLogScrollViewContentOffset() {
        let contentOffset = CGPoint(
            x: 0,
            y: logScrollView.contentSize.height - logScrollView.bounds.height
        )
        logScrollView.layoutIfNeeded()
        logScrollView.setContentOffset(contentOffset, animated: true)
    }
    
    func removeAllLogStackView() {
        formulaStackView.arrangedSubviews.forEach { view in
            view.removeFromSuperview()
        }
    }
}


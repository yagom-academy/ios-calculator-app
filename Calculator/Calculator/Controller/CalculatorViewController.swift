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
    private var isNegativeSign: Bool = false
    private var isCalculated: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setOperandLabelToZero()
        setOperatorLabelEmpty()
    }
    
    @IBAction func operandButtonTapped(_ sender: UIButton) {
        guard !isCalculated else {
            return
        }
        
        guard let selectedOperand = Operand.matchOperandButtonTag(location: sender.tag) else {
            return
        }
        
        updateOperandLabel(with: selectedOperand.bringOperandSymbol)
        isFirstInput = false
    }
    
    @IBAction func dotButtonTapped(_ sender: UIButton) {
        guard !isCalculated else {
            return
        }
        
        guard !isDotButtonTapped else {
            return
        }
        
        if !operand.isEmpty  {
            operandLabel.text = operand.formatStyleToDecimal() + CalculatorConstant.dot
            operand += CalculatorConstant.dot
            isDotButtonTapped = true
        } else if operand.isEmpty {
            operand += CalculatorConstant.zero + CalculatorConstant.dot
            operandLabel.text = operand
        }
    }
    
    @IBAction func zeroButtonTapped(_ sender: UIButton) {
        guard !isCalculated && !operand.isEmpty else {
            return
        }
        
        var input: String = CalculatorConstant.blank
        if operand.last == Character(CalculatorConstant.dot) {
            input = CalculatorConstant.dotZero
        } else {
            input = CalculatorConstant.zero
        }
        
        operandLabel.text = operand.formatStyleToDecimal() + input
        operand += CalculatorConstant.zero
    }
    
    @IBAction func doubleZeroButtonTapped(_ sender: UIButton) {
        guard !isCalculated && !operand.isEmpty else {
            return
        }
        
        var input: String = CalculatorConstant.blank
        if operand.last == Character(CalculatorConstant.dot) {
            input = CalculatorConstant.dotDoubleZero
        } else {
            input = CalculatorConstant.doubleZero
        }
        
        operandLabel.text = operand.formatStyleToDecimal() + input
        operand += CalculatorConstant.zero
    }
    
    @IBAction func operatorButtonTapped(_ sender: UIButton) {
        guard let selectedOperator = sender.currentTitle else {
            return
        }
        
        guard !isFirstInput else {
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
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        guard !isCalculated else {
            return
        }
        
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
        guard !isCalculated else {
            return
        }
        
        guard !operand.isEmpty else{
            return
        }
        
        if !isNegativeSign {
            operand = CalculatorConstant.negativeSign + operand
        } else {
            operand = operand.trimmingCharacters(in: CalculatorConstant.negativeSignSet)
        }
        
        operandLabel.text = operand
        isNegativeSign.toggle()
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
        operand += input
        operandLabel.text = operand.formatStyleToDecimal()
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
        guard let result = try? formula.result() else {
            operandLabel.text = CalculatorConstant.notNumber
            return
        }
        
        updateOperandLabel(with: String(result))
        return
    }
    
    func updateLogScrollViewContentOffset() {
        logScrollView.layoutIfNeeded()
        let contentOffset = CGPoint(
            x: 0,
            y: logScrollView.contentSize.height - logScrollView.bounds.height
        )
        logScrollView.setContentOffset(contentOffset, animated: true)
    }
    
    func removeAllLogStackView() {
        formulaStackView.arrangedSubviews.forEach { view in
            view.removeFromSuperview()
        }
    }
}


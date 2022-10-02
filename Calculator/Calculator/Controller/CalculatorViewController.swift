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
        
        if !operand.isEmpty && !isDotButtonTapped {
            operandLabel.text = setNumberFormat(with: operand) + CalculatorConstant.dot
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
        
        operandLabel.text = setNumberFormat(with: operand) + input
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
        
        operandLabel.text = setNumberFormat(with: operand) + input
        operand += CalculatorConstant.zero
    }
    
    @IBAction func operatorButtonTapped(_ sender: UIButton) {
        guard let selectedOperator = sender.currentTitle else {
            return
        }
        
        guard !isCalculated else {
            return
        }
        
        guard !isFirstInput else {
            return
        }
        
        if !operand.isEmpty {
            creatFormulaLog()
        }
        
        updateOperatorLabel(with: selectedOperator)
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        guard !isCalculated else {
            return
        }
        
        if operand.isEmpty {
            operand += CalculatorConstant.zero
        }
        
        creatFormulaLog()
        calculate()
        setOperatorLabelEmpty()
        arithmeticOperator.removeAll()
        isCalculated = true
    }
    
    @IBAction func allClearButtonTapped(_ sender: UIButton) {
        setOperandLabelToZero()
        setOperatorLabelEmpty()
        formulaStackView.arrangedSubviews.forEach { view in
            view.removeFromSuperview()
        }
        
        isFirstInput = true
        isDotButtonTapped = false
        isCalculated = false
        operand.removeAll()
        arithmeticOperator.removeAll()
        finalFormula.removeAll()
    }
    
    @IBAction func clearEntryButtonTapped(_ sender: UIButton) {
        guard !isCalculated else {
            return
        }
        
        if !operand.isEmpty {
            operand.removeAll()
            setOperandLabelToZero()
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
    
    func creatStackView() {
        let logOperand = setNumberFormat(with: operand)
        let stackView = LogStackView(operand: logOperand, arithmeticOperator: arithmeticOperator)
        formulaStackView.addArrangedSubview(stackView)
        updateLogScrollViewContentOffset()
    }
    
    func removeLastDot() {
        operand = operand.trimmingCharacters(in: CalculatorConstant.dotSet)
    }
    
    func creatFinalFormula() {
        finalFormula += arithmeticOperator
        finalFormula += operand
    }
    
    func updateOperandLabel(with input: String) {
        operand += input
        operandLabel.text = setNumberFormat(with: operand)
    }
    
    func updateOperatorLabel(with input: String) {
        if !isCalculated {
            arithmeticOperator = input
            operatorLabel.text = arithmeticOperator
        }
    }

    func setOperandLabelToZero() {
        operandLabel.text = CalculatorConstant.zero
    }
    
    func setOperatorLabelEmpty() {
        operatorLabel.text = CalculatorConstant.blank
    }
    
    func setNumberFormat(with input: String) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumIntegerDigits = 20
        numberFormatter.maximumFractionDigits = 20
        guard let result = numberFormatter.string(for: Double(input)) else {
            return input
        }
        
        return result
    }
    
    func creatFormulaLog() {
        removeLastDot()
        creatStackView()
        setOperandLabelToZero()
        creatFinalFormula()
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
}


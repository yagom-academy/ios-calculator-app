//
//  Calculator - CalculatorViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class CalculatorViewController: UIViewController {
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var calculateStackView: UIStackView!
    @IBOutlet weak var calculateScrollView: UIScrollView!
    private var isCalculated: Bool = false
    private var expression: [String] = []
    private var calculateOperand: String = Symbol.zero {
        didSet {
            operandLabel.text = calculateOperand
        }
    }
    private var calculateOperator: String = Symbol.empty {
        didSet {
            operatorLabel.text = calculateOperator
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func didTapACButton() {
        resetCalculatorItemView()
        resetOperand()
        resetOperator()
        expression.removeAll()
    }
    
    @IBAction private func didTapCEButton() {
        resetOperand()
    }
    
    @IBAction private func didTapChangeSignButton() {
        guard calculateOperand != Symbol.zero,
              calculateOperand != Symbol.nan else { return }
        
        guard let calculateNumberFirst = calculateOperand.first else { return }
        
        if calculateNumberFirst == Character(Symbol.minus) {
            calculateOperand.removeFirst()
        } else {
            calculateOperand = Symbol.minus + calculateOperand
        }
    }
    
    @IBAction private func didTapResultButton() {
        guard !isCalculated, calculateOperator != Symbol.empty else { return }
        guard let calculatedNumber = operandLabel.text?.withoutComma else { return }
        guard let number = Double(calculatedNumber) else { return }
        
        let formatNumber = NumberFormatter.convertToString(fromDouble: number)
        
        addExpressionAndCalculateItem(sign: calculateOperator,
                                      number: "\(number)",
                                      operand: formatNumber)
 
        calculateOperand = calculate()
        isCalculated = true
        resetOperator()
        expression.removeAll()
        scrollToBottom()
    }
    
    @IBAction private func didTapOperatorButton(_ sender: UIButton) {
        restartCalculate()
        guard let operatorSign = sender.currentTitle,
              !calculateOperand.hasSuffix(Symbol.dot) else { return }
        guard calculateOperand != Symbol.zero else {
            if  calculateOperator != Symbol.empty {
                calculateOperator = operatorSign
            }
            return
        }
        
        guard let calculatedNumber = operandLabel.text?.withoutComma else { return }
        let calculatedOperand = NumberFormatter.convertToString(fromString: calculatedNumber)
            
        addExpressionAndCalculateItem(sign: calculateOperator,
                                      number: calculatedNumber,
                                      operand: calculatedOperand)
        scrollToBottom()
        calculateOperator = operatorSign
        resetOperand()
    }
    
    @IBAction private func didTapNumberButton(_ sender: UIButton) {
        guard calculateOperand.count <= Symbol.maxSignificantDigits else { return }
        guard let number = sender.currentTitle else { return }
        restartCalculate()
        
        if calculateOperand == Symbol.zero {
            guard number != Symbol.zero, number != Symbol.doubleZero else { return }
            calculateOperand = number
        } else {
            if calculateOperand.contains(Symbol.dot) {
                calculateOperand += number
            } else {
                calculateOperand = NumberFormatter.convertToString(fromString: calculateOperand + number)
            }
        }
    }
    
    @IBAction private func didTapDotButton(_ sender: UIButton) {
        guard let dot = sender.currentTitle else { return }
        guard !calculateOperand.contains(dot) else { return }
        
        calculateOperand += dot
    }
    
    private func addExpressionAndCalculateItem(sign: String, number: String, operand: String) {
        appendExpression(sign: sign, number: number)
        addStackView()
    }
    
    private func appendExpression(sign: String, number: String) {
        expression.append(sign)
        expression.append(number)
    }
    
    private func restartCalculate() {
        if isCalculated {
            isCalculated = false
        }
    }
    
    private func calculate() -> String {
        var formula = ExpressionParser.parse(from: expression.joined(separator: Symbol.empty))
        guard let result = formula.result() else { return Symbol.empty }
        
        return NumberFormatter.convertToString(fromDouble: result)
    }
    
    private func scrollToBottom() {
        let bottomOffset = CGPoint(
            x: Symbol.origin,
            y: calculateScrollView.contentSize.height - calculateScrollView.bounds.height
        )
        
        calculateScrollView.setContentOffset(bottomOffset, animated: true)
        calculateScrollView.layoutIfNeeded()
    }
    
    private func generateUILabel() -> UILabel {
        let label = UILabel()
        label.text = calculateOperator + Symbol.blank + NumberFormatter.convertToString(fromString: calculateOperand)
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        
        return label
    }
    
    private func addStackView() {
        let stackLabel = generateUILabel()
        calculateStackView.addArrangedSubview(stackLabel)
        scrollToBottom()
    }
    
    private func resetCalculatorItemView() {
        calculateStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    private func resetOperand() {
        calculateOperand = Symbol.zero
    }
    
    private func resetOperator() {
        calculateOperator = Symbol.empty
    }
}


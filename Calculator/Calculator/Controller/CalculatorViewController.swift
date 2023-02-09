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
        guard calculateOperand != Symbol.zero, calculateOperand != Symbol.nan,
              let calculateNumberFirst = calculateOperand.first else { return }
        
        if calculateNumberFirst == Character(Symbol.minus) {
            calculateOperand.removeFirst()
        } else {
            calculateOperand = Symbol.minus + calculateOperand
        }
    }
    
    @IBAction private func didTapResultButton() {
        guard !isCalculated, calculateOperator != Symbol.empty,
              let calculatedNumber = operandLabel.text?.withoutComma,
              let number = Double(calculatedNumber) else { return }
        
        addExpressionAndCalculateItem(initialNumber: "\(number)")
        calculateOperand = calculate()
        isCalculated = true
        resetOperator()
        expression.removeAll()
        scrollToBottom()
    }
    
    @IBAction private func didTapOperatorButton(_ sender: UIButton) {
        guard let operatorSign = sender.currentTitle,
              let calculatedNumber = operandLabel.text?.withoutComma else { return }
        guard calculateOperand != Symbol.zero else {
            if  calculateOperator != Symbol.empty {
                calculateOperator = operatorSign
            }
            return
        }
        
        addExpressionAndCalculateItem(initialNumber: calculatedNumber)
        scrollToBottom()
        isCalculated = false
        calculateOperator = operatorSign
        resetOperand()
    }
    
    @IBAction private func didTapNumberButton(_ sender: UIButton) {
        guard calculateOperand.count <= Number.maxSignificantDigits,
              let number = sender.currentTitle else { return }
        if isCalculated {
            guard number != Symbol.zero, number != Symbol.doubleZero else { return }
            calculateOperand = number
            resetCalculatorItemView()
            isCalculated = false
            return
        }
        
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
        guard !calculateOperand.contains(Symbol.dot) else { return }
        calculateOperand += Symbol.dot
    }
    
    private func addExpressionAndCalculateItem(initialNumber: String) {
        appendExpression(initialNumber)
        addStackView()
    }
    
    private func appendExpression(_ number: String) {
        expression.append(calculateOperator)
        expression.append(number)
    }
    
    private func calculate() -> String {
        var formula = ExpressionParser.parse(from: expression.joined(separator: Symbol.empty))
        do {
            let result = try formula.result()
            return NumberFormatter.convertToString(fromDouble: result)
        } catch {
            return Symbol.error
        }
    }
    
    private func scrollToBottom() {
        let bottomOffset = CGPoint(
            x: Number.origin,
            y: calculateScrollView.contentSize.height - calculateScrollView.bounds.height
        )
        calculateScrollView.layoutIfNeeded()
        calculateScrollView.setContentOffset(bottomOffset, animated: true)
    }
    
    private func generateUILabel() -> UILabel {
        let label = UILabel()
        if calculateOperator.isEmpty {
            label.text = NumberFormatter.convertToString(fromString: calculateOperand)
        } else {
            label.text = calculateOperator + Symbol.blank + NumberFormatter.convertToString(fromString: calculateOperand)
        }
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

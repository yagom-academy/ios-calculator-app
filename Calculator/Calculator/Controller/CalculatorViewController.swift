//
//  Calculator - CalculatorViewController.swift
//  Created by 리지, vetto, Andrew
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
        ViewManager.resetStackView(calculateStackView)
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
        ViewManager.scrollToBottom(calculateScrollView)
    }
    
    @IBAction private func didTapOperatorButton(_ sender: UIButton) {
        guard let operatorSign = sender.currentTitle,
              let calculatedNumber = operandLabel.text?.withoutComma else { return }
        guard calculateOperand != Symbol.zero else {
            if calculateOperator != Symbol.empty {
                calculateOperator = operatorSign
            }
            return
        }
        
        addExpressionAndCalculateItem(initialNumber: calculatedNumber)
        ViewManager.scrollToBottom(calculateScrollView)
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
            ViewManager.resetStackView(calculateStackView)
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
                calculateOperand = NumberFormatter.convertToString(
                    fromString: calculateOperand + number
                )
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
        ViewManager.scrollToBottom(calculateScrollView)
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
    
    private func addStackView() {
        let text: String
        if calculateOperator.isEmpty {
            text = NumberFormatter.convertToString(fromString: calculateOperand)
        } else {
            text = calculateOperator +
              Symbol.blank +
                NumberFormatter.convertToString(fromString: calculateOperand)
        }
        calculateStackView.addArrangedSubview(ViewManager.generateUILabel(text))
    }
    
    private func resetOperand() {
        calculateOperand = Symbol.zero
    }
    
    private func resetOperator() {
        calculateOperator = Symbol.empty
    }
}

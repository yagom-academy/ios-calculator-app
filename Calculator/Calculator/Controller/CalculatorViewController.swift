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
    private let numberFormatter = NumberFormatter()
    private var calculateOperand: String = Symbol.zero {
        didSet {
            operandLabel.text = calculateOperand
        }
    }
    private var calculateOperator: String = Symbol.blank {
        didSet {
            operatorLabel.text = calculateOperator
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupOperandAndOperator() {
        resetOperand()
        resetOperator()
    }
    
    @IBAction private func didTapACButton() {
        calculateStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        resetOperand()
        resetOperator()
    }
    
    @IBAction private func didTapCEButton() {
        if isCalculated == false {
            calculateOperand = Symbol.zero
        }
    }
    
    @IBAction private func didTapChangeSignButton() {
        guard calculateOperand != Symbol.zero else { return }
        
        guard let calculateNumberFirst = calculateOperand.first else { return }
        
        if calculateNumberFirst == Character(Symbol.minus) {
            calculateOperand.removeFirst()
        } else {
            calculateOperand = Symbol.minus + calculateOperand
        }
    }
    
    @IBAction private func didTapResultButton() {
        guard !isCalculated, calculateOperator != Symbol.blank else { return }
        
        addExpressionAndCalculateItem(sign: calculateOperator, number: calculateOperand)
        
        var formula = ExpressionParser.parse(from: expression.joined(separator: Symbol.blank))
        
        let result = formula.result()
        
        if result.isNaN {
            calculateOperand = Symbol.nan
        } else {
            let resultString = "\(result)"
            calculateOperand = resultString
        }
        
        isCalculated = true
        resetOperator()
        expression.removeAll()
    }
    
    @IBAction private func didTapOperatorButton(_ sender: UIButton) {
        guard let operatorSign = sender.currentTitle else { return }
        guard calculateOperand != Symbol.zero || calculateOperator != Symbol.blank else { return }
        guard calculateOperand != Symbol.zero || calculateOperator == Symbol.blank else {
            calculateOperator = operatorSign
            return
        }
        
        if isCalculated {
            guard let calculatedNumber = operandLabel.text?.filter({ $0 != Character(Symbol.comma) }) else { return }
            
            addExpressionAndCalculateItem(sign: calculateOperator, number: calculatedNumber)
        } else {
            addExpressionAndCalculateItem(sign: calculateOperator, number: calculateOperand)
        }
        
        scrollToBottom()
        
        isCalculated = false
        calculateOperator = operatorSign
        calculateOperand = Symbol.zero
    }
    
    @IBAction private func didTapNumberButton(_ sender: UIButton) {
        guard calculateOperand.count <= Symbol.maxSignificantDigits else { return }
        guard let number = sender.currentTitle else { return }
        
        if isCalculated {
            calculateOperand = number
            isCalculated = false
            return
        }
        
        if calculateOperand == Symbol.zero {
            if number == Symbol.zero || number == Symbol.doubleZero {
                return
            }
            calculateOperand = number
        } else {
            calculateOperand += number
        }
    }
    
    @IBAction private func didTapDotButton(_ sender: UIButton) {
        guard let dot = sender.currentTitle else { return }
        guard !calculateOperand.contains(Symbol.dot) else { return }
        
        calculateOperand += dot
    }
    
    private func addExpressionAndCalculateItem(sign: String, number: String) {
        appendExpression(sign: sign, number: number)
        addToCalculateItem(left: sign, right: number)
    }
    
    private func appendExpression(sign: String, number: String) {
        expression.append(sign)
        expression.append(number)
    }
    
    private func addToCalculateItem(left: String, right: String) {
        let operatorUILabel = generateUILabel(title: left)
        let operandUILabel = generateUILabel(title: right)
        let stackView = generateUIStackView(left: operatorUILabel, right: operandUILabel)
        
        calculateStackView.addArrangedSubview(stackView)
        scrollToBottom()
    }
    
    private func scrollToBottom() {
        let bottomOffset = CGPoint(
            x: 0,
            y: calculateScrollView.contentSize.height - calculateScrollView.bounds.height
        )
        
        calculateScrollView.layoutIfNeeded()
        calculateScrollView.setContentOffset(bottomOffset, animated: true)
    }
    
    private func generateUILabel(title: String) -> UILabel {
        let label = UILabel()
        label.text = title
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        
        return label
    }
    
    private func generateUIStackView(left: UILabel, right: UILabel) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.addArrangedSubview(left)
        stackView.addArrangedSubview(right)
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        
        return stackView
    }
    
    private func resetOperand() {
        calculateOperand = Symbol.zero
    }
    
    private func resetOperator() {
        calculateOperator = Symbol.blank
    }
    
    private func resetLabel() {
        resetOperand()
        resetOperator()
    }
}


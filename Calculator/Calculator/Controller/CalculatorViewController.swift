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
    private var calculateOperator: String = Symbol.blank {
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
        guard !isCalculated, calculateOperator != Symbol.blank else { return }
        guard let calculatedNumber = operandLabel.text?.withoutComma else { return }
        guard let number = Double(calculatedNumber) else { return }
        
        let formatNumber = NumberFormatter.convertToString(fromDouble: number)
        
        addExpressionAndCalculateItem(sign: calculateOperator,
                                      number: "\(number)",
                                      operand: formatNumber)
        
        var formula = ExpressionParser.parse(from: expression.joined(separator: Symbol.blank))
        guard let result = formula.result() else { return }
        calculateOperand = NumberFormatter.convertToString(fromDouble: result)
        isCalculated = true
        resetOperator()
        expression.removeAll()
    }
    
    @IBAction private func didTapOperatorButton(_ sender: UIButton) {
        guard let operatorSign = sender.currentTitle else { return }
        guard calculateOperand != Symbol.zero else {
            if  calculateOperator != Symbol.blank {
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
        
        isCalculated = false
        calculateOperator = operatorSign
        resetOperand()
    }
    
    @IBAction private func didTapNumberButton(_ sender: UIButton) {
        guard calculateOperand.count <= Symbol.maxSignificantDigits else { return }
        guard let number = sender.currentTitle else { return }
        
        if isCalculated {
            guard number != Symbol.zero, number != Symbol.doubleZero else { return }
            
            calculateOperand = number
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
    
    private func addExpressionAndCalculateItem(sign: String, number: String, operand: String) {
        appendExpression(sign: sign, number: number)
        addToCalculateItem(left: sign, right: operand)
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
    
    private func resetCalculatorItemView() {
            calculateStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        }
    
    private func resetOperand() {
        calculateOperand = Symbol.zero
    }
    
    private func resetOperator() {
        calculateOperator = Symbol.blank
    }
}


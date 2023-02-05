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
    private var expression: [String] = []
    private let numberFormatter = NumberFormatter()
    private var isCalculated: Bool = false
    private var calculateOperand: String = "0" {
        didSet {
            operandLabel.text = calculateOperand
        }
    }
    private var calculateOperator: String = "" {
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
            calculateOperand = "0"
        }
    }
    
    @IBAction private func didTapChangeSignButton() {
        guard calculateOperand != "0" else { return }
        
        guard let calculateNumberFirst = calculateOperand.first else { return }
        
        if calculateNumberFirst == "-" {
            calculateOperand.removeFirst()
        } else {
            calculateOperand = "-" + calculateOperand
        }
    }
    
    @IBAction private func didTapResultButton() {
        guard !isCalculated, calculateOperator != "" else { return }
        
        addExpressionAndCalculateItem(sign: calculateOperator, number: calculateOperand)
        
        var formula = ExpressionParser.parse(from: expression.joined(separator: ""))
        
        let result = formula.result()
        
        if result.isNaN {
            calculateOperand = "NaN"
        } else {
            let resultString = "\(result)"
            calculateOperand = resultString
        }
        
        resetOperator()
        isCalculated = true
        expression.removeAll()
    }
    
    @IBAction private func didTapOperatorButton(_ sender: UIButton) {
        guard let operatorSign = sender.currentTitle else { return }
        guard calculateOperand != "0" || calculateOperator != "" else { return }
        guard calculateOperand != "0" || calculateOperator == "" else {
            calculateOperator = operatorSign
            return
        }
        
        if isCalculated {
            guard let calculatedNumber = operandLabel.text?.filter({ $0 != "," }) else { return }
            
            addExpressionAndCalculateItem(sign: calculateOperator, number: calculatedNumber)
        } else {
            addExpressionAndCalculateItem(sign: calculateOperator, number: calculateOperand)
        }
        
        scrollToBottom()
        
        isCalculated = false
        calculateOperator = operatorSign
        calculateOperand = "0"
    }
    
    @IBAction private func didTapNumberButton(_ sender: UIButton) {
        guard calculateOperand.count <= 20 else { return }
        guard let number = sender.currentTitle else { return }
        
        if isCalculated {
            calculateOperand = number
            isCalculated = false
            return
        }
        
        if calculateOperand == "0" {
            if number == "0" || number == "00" {
                return
            }
            calculateOperand = number
        } else {
            calculateOperand += number
        }
    }
    
    @IBAction private func didTapDotButton(_ sender: UIButton) {
        guard let dot = sender.currentTitle else { return }
        guard !calculateOperand.contains(".") else { return }
        
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
        calculateOperand = "0"
    }
    
    private func resetOperator() {
        calculateOperator = ""
    }
    
    private func resetLabel() {
        resetOperand()
        resetOperator()
    }
}


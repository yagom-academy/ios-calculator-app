//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class CalculatorViewController: UIViewController {
    private var calculateExpression: String = ""
    private var operandExpression: String = ""
    private let numberFormatter = NumberFormatter()
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var expressionStackView: UIStackView!
    @IBOutlet weak var expressionScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.text = "0"
        setNumberFormatter()
    }
    
    @IBAction private func numberButton(sender: UIButton) {
        guard let buttonNumberValue = sender.titleLabel?.text  else { return }
        makeZeroDot(pushedNumber: buttonNumberValue)
        
        if checkOverlappedDot(pushedNumber: buttonNumberValue) == true { return }
        if checkZeroValidate(pushedNumber: buttonNumberValue) == false { return }
        
        operandExpression += buttonNumberValue
        divideIntoThreeDigit()
    }
    
    @IBAction private func operatorButton(sender: UIButton) {
        guard let `operator` = sender.titleLabel?.text else { return }
        guard let operatorExpression = operatorLabel.text else { return }
        
        removeDot()
        operatorLabel.text = `operator`
        if operandExpression == "" { return }
        
        if calculateExpression == "" {
            calculateExpression += operandExpression
            updateExpressionStackView(operatorType: operatorExpression, operand: operandExpression)
        } else {
            calculateExpression += operatorExpression + operandExpression
            updateExpressionStackView(operatorType: operatorExpression, operand: operandExpression)
        }
        
        numberLabel.text = "0"
        operandExpression = ""
    }
    
    @IBAction private func ceButton(_ sender: Any) {
        operandExpression = ""
        numberLabel.text = "0"
    }
    
    @IBAction private func acButton(_ sender: Any) {
        calculateExpression = ""
        numberLabel.text = "0"
        operatorLabel.text = ""
        operandExpression = ""
        expressionStackView.subviews.map( { $0.removeFromSuperview() })
    }
    
    @IBAction private func changeNegativeButton(_ sender: Any) {
        if numberLabel.text == "0" { return }
        
        guard let numberLabelText = numberLabel.text else { return }
        
        if numberLabelText.first == "-" && operandExpression.first == "-" {
            numberLabel.text = numberLabelText.trimmingCharacters(in: ["-"])
            operandExpression = numberLabelText.trimmingCharacters(in: ["-"])
        } else {
            numberLabel.text = "-" + numberLabelText
            operandExpression = "-" + numberLabelText
        }
    }
    
    @IBAction private func resultButton(_ sender: Any) {
        
        if operandExpression == "" { return }
        guard let operatorLabelText = operatorLabel.text else { return }
        calculateExpression += operatorLabelText + operandExpression
        var formula = ExpressionParser.parse(from: calculateExpression)
        
        removeDot()
        
        updateExpressionStackView(operatorType: operatorLabelText, operand: operandExpression)
        operandExpression = ""
        operatorLabel.text = ""
        numberLabel.text = String(formula.result())
    }
    
    private func checkOverlappedDot(pushedNumber: String) -> Bool {
        if let lastNumber = numberLabel?.text?.last, lastNumber == ".", pushedNumber == "." {
            return true
        } else { return false }
    }
    
    private func removeDot() {
        if operandExpression.last == "." {
            operandExpression.removeLast()
            numberLabel?.text?.removeLast()
        }
    }
    
    private func makeZeroDot(pushedNumber: String) {
        if numberLabel.text == "0" && pushedNumber == "." {
            operandExpression = "0"
        }
    }
    
    private func checkZeroValidate(pushedNumber: String) -> Bool {
        guard let inputtedNumberLabel = numberLabel.text else { return true }
        if inputtedNumberLabel == "0" && (pushedNumber == "00" || pushedNumber == "0") {
            numberLabel.text = "0"
            operandExpression = "0"
            return false
        } else { return true }
    }
    
    private func updateExpressionStackView(operatorType: String, operand: String) {
    
        let operatorExpressionLabel = UILabel()
        operatorExpressionLabel.textColor = .white
            
        let operandExpressionLabel = UILabel()
        operandExpressionLabel.textColor = .white
            
        operatorExpressionLabel.text = operatorType
        operandExpressionLabel.text = operand
        
        if Double(calculateExpression) != nil {
            operatorExpressionLabel.text = nil
            operandExpressionLabel.text = operand
        } else {
            operatorExpressionLabel.text = operatorType
            operandExpressionLabel.text = operand
        }
        
        let partOfExpressionStackView = UIStackView()
        partOfExpressionStackView.axis = .horizontal
        partOfExpressionStackView.distribution = .fillProportionally
        partOfExpressionStackView.spacing = 5
        partOfExpressionStackView.addArrangedSubview(operatorExpressionLabel)
        partOfExpressionStackView.addArrangedSubview(operandExpressionLabel)
        
        expressionStackView.addArrangedSubview(partOfExpressionStackView)
        maintainScrollViewBottom()
    
    }
    
    private func maintainScrollViewBottom() {
        expressionScrollView.layoutIfNeeded()
        expressionScrollView.setContentOffset(
            CGPoint(x: 0, y: expressionScrollView.contentSize.height - expressionScrollView.bounds.height),
            animated: true)
    }
    
    private func setNumberFormatter() {
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
        numberFormatter.roundingMode = .halfUp
    }
    
    private func divideIntoThreeDigit() {
        if numberLabel.text != nil {
            numberLabel.text = numberFormatter.string(for: Double(operandExpression))
        }
    }
}

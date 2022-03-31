//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class CalculatorViewController: UIViewController {
    private var allOperations: [String] = []
    private let blank: String = ""
    
    @IBOutlet weak var calculatorStackView: UIStackView!
    
    @IBOutlet weak var currentOperatorLabel: UILabel!
    @IBOutlet weak var currentNumberLabel: UILabel!
    
    @IBAction func touchUpNumberButton(_ sender: UIButton) {
        let currentNumberLabelText = currentNumberLabel.text.unwrapped
        let buttonTitle = sender.currentTitle.unwrapped
        
        guard isvalidLength(texts: [currentNumberLabelText, buttonTitle], maximumLength: 20) else { return }
        
        var updatedNumber: String
        if currentNumberLabelText == "0" {
            updatedNumber = buttonTitle
        } else {
            updatedNumber = currentNumberLabelText + buttonTitle
        }
        currentNumberLabel.text = changeDecimalFormat(updatedNumber)
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        let currentNumberLabelText = currentNumberLabel.text.unwrapped
        let currentOperatorLabelText = currentOperatorLabel.text.unwrapped
        let buttonTitle = sender.currentTitle.unwrapped
        addInputStack()
        
        if allOperations.isEmpty == false {
            allOperations.append(currentOperatorLabelText)
        }
        
        allOperations.append(currentNumberLabelText)
        currentNumberLabel.text = "0"
        currentOperatorLabel.text = buttonTitle
    }
    
    @IBAction func touchUpDotButton(_ sender: UIButton) {
        let currentNumberLabelText = currentNumberLabel.text.unwrapped
        guard (currentNumberLabel.text?.contains(".")) == true else {
            currentNumberLabel.text = currentNumberLabelText + "."
            return
        }
    }
    
    @IBAction func touchUpZeroButton(_ sender: UIButton) {
        let currentNumberLabelText = currentNumberLabel.text.unwrapped
        let buttonTitle = sender.currentTitle.unwrapped
        
        guard isvalidLength(texts: [currentNumberLabelText, buttonTitle], maximumLength: 20) else { return }
        
        if currentNumberLabelText.contains(".") == true {
            currentNumberLabel.text = currentNumberLabelText + buttonTitle
        } else {
            currentNumberLabel.text = changeDecimalFormat(currentNumberLabelText + buttonTitle)
        }
    }
    
    @IBAction func touchUpPlusMinusSignButton(_ sender: UIButton) {
        var currentNumberLabelText = currentNumberLabel.text.unwrapped
        
        switch currentNumberLabelText.first {
        case "0":
            break
        case "-":
            _ = currentNumberLabelText.removeFirst()
        default:
            currentNumberLabelText.insert("-", at: currentNumberLabelText.startIndex)
        }
        
        currentNumberLabel.text = changeDecimalFormat(currentNumberLabelText)
    }
    
    @IBAction func touchUpAllClearButton(_ sender: UIButton) {
        clearAllHistory()
        allOperations = []
    }
    
    @IBAction func touchUpClearEntryButton(_ sender: UIButton) {
        if allOperations.isEmpty {
            clearAllHistory()
        } else {
            currentNumberLabel.text = "0"
        }
    }

    @IBAction func touchUpCalculateButton(_ sender: UIButton) {
        let currentNumberLabelText = currentNumberLabel.text.unwrapped
        let currentOperatorLabelText = currentOperatorLabel.text.unwrapped
        
        allOperations.append(currentOperatorLabelText)
        allOperations.append(currentNumberLabelText)
        
        if allOperations.isEmpty != true {
            addInputStack()
            let mergedAllOperation = allOperations.joined(separator: " ")
            let validOperation = removeComma(from: mergedAllOperation)
            let formula = ExpressionParser.parse(from: validOperation)
            let result = formula.result()
            
            currentOperatorLabel.text = ""
            currentNumberLabel.text = changeDecimalFormat("\(result)")
            allOperations = []
        }
    }
    
    private func removeComma(from input: String) -> String {
        return input.replacingOccurrences(of: ",", with: "")
    }
    
    private func isvalidLength(texts: [String], maximumLength: Int) -> Bool {
        let textCount = texts.reduce(0) { $0 + removeComma(from: $1).count }
        
        return textCount <= maximumLength
    }
    
    private func clearAllHistory() {
        calculatorStackView.subviews.forEach { $0.removeFromSuperview() }
        currentNumberLabel.text = "0"
        currentOperatorLabel.text = ""
    }
    
    private func changeDecimalFormat(_ text: String) -> String {
        let zero: NSNumber = 0
        
        guard text != "nan" else { return "NaN" }
        let noCommaText = removeComma(from: text)
        
        let numberFomatter = NumberFormatter()
        numberFomatter.numberStyle = .decimal
        
        let number = numberFomatter.number(from: noCommaText) ?? zero
        
        let changedNumber = numberFomatter.string(from: number) ?? blank
        return changedNumber
    }
    
    private func addInputStack() {
        guard let stack = generateStack() else {
            return
        }
        
        calculatorStackView.addArrangedSubview(stack)
        setScrollViewLayout()
    }
    
    private func generateStack() -> UIStackView? {
        guard let (operatorStackLabel, numberStackLabel) = generateStackLabels() else {
            return nil
        }
        let stack = UIStackView()
        
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .fill
        stack.alignment = .fill
        
        stack.addArrangedSubview(operatorStackLabel)
        stack.addArrangedSubview(numberStackLabel)
        
        return stack
    }
    
    private func generateStackLabels() -> (UILabel, UILabel)? {
        let `operator` = currentOperatorLabel.text.unwrapped
        let number = currentNumberLabel.text.unwrapped
        let operatorStackLabel = UILabel()
        let numberStackLabel = UILabel()
        
        operatorStackLabel.textColor = .white
        operatorStackLabel.text = `operator`
        
        numberStackLabel.textColor = .white
        numberStackLabel.text = number
        
        return (operatorStackLabel, numberStackLabel)
    }
    
    private func setScrollViewLayout() {
        guard let scrollView = calculatorStackView.superview as? UIScrollView else {
            return
        }
        
        scrollView
            .setContentOffset(
                CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.height),
                animated: true
            )
    }
}


//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class CalculatorViewController: UIViewController {
    private var allOperations: [String] = []
    
    @IBOutlet weak var calculatorStackView: UIStackView!
    
    @IBOutlet weak var currentOperatorLabel: UILabel!
    @IBOutlet weak var currentNumberLabel: UILabel!
    
    @IBAction func touchUpNumberButton(_ sender: UIButton) {
        let currentNumberLabelText = currentNumberLabel.text.unwrapped
        let buttonTitle = sender.currentTitle.unwrapped
        
        guard isvalidLength(texts: [currentNumberLabelText, buttonTitle], maximumLength: CalculatorConstant.maximumLength) else { return }
        
        var updatedNumber: String
        if currentNumberLabelText == CalculatorConstant.defaultNumber {
            updatedNumber = buttonTitle
        } else {
            updatedNumber = currentNumberLabelText + buttonTitle
        }
        currentNumberLabel.text = updatedNumber.numberFomatter()
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        let currentNumberLabelText = currentNumberLabel.text.unwrapped
        let currentOperatorLabelText = currentOperatorLabel.text.unwrapped
        let buttonTitle = sender.currentTitle.unwrapped
        
        guard currentNumberLabelText != CalculatorConstant.defaultNumber else {
            return
        }
        
        addInputStack()
        
        if allOperations.isEmpty == false {
            allOperations.append(currentOperatorLabelText)
        }
        
        allOperations.append(currentNumberLabelText)
        setLabels(operatorText: buttonTitle)
    }
    
    @IBAction func touchUpDotButton(_ sender: UIButton) {
        let currentNumberLabelText = currentNumberLabel.text.unwrapped
        guard (currentNumberLabel.text?.contains(CalculatorConstant.dot)) == true else {
            currentNumberLabel.text = currentNumberLabelText + CalculatorConstant.dot
            return
        }
    }
    
    @IBAction func touchUpZeroButton(_ sender: UIButton) {
        let currentNumberLabelText = currentNumberLabel.text.unwrapped
        let buttonTitle = sender.currentTitle.unwrapped
        
        guard isvalidLength(texts: [currentNumberLabelText, buttonTitle], maximumLength: CalculatorConstant.maximumLength) else { return }
        
        if currentNumberLabelText.contains(CalculatorConstant.dot) == true {
            currentNumberLabel.text = currentNumberLabelText + buttonTitle
        } else {
            currentNumberLabel.text = (currentNumberLabelText + buttonTitle).numberFomatter()
        }
    }
    
    @IBAction func touchUpPlusMinusSignButton(_ sender: UIButton) {
        var currentNumberLabelText = currentNumberLabel.text.unwrapped
        
        switch currentNumberLabelText.first {
        case Character(CalculatorConstant.defaultNumber):
            break
        case CalculatorConstant.minus:
            _ = currentNumberLabelText.removeFirst()
        default:
            currentNumberLabelText.insert(CalculatorConstant.minus, at: currentNumberLabelText.startIndex)
        }
        
        currentNumberLabel.text = currentNumberLabelText.numberFomatter()
    }
    
    @IBAction func touchUpAllClearButton(_ sender: UIButton) {
        clearAllHistory()
        allOperations = []
    }
    
    @IBAction func touchUpClearEntryButton(_ sender: UIButton) {
        if allOperations.isEmpty {
            clearAllHistory()
        } else {
            currentNumberLabel.text = CalculatorConstant.defaultNumber
        }
    }

    @IBAction func touchUpCalculateButton(_ sender: UIButton) {
        let currentNumberLabelText = currentNumberLabel.text.unwrapped
        let currentOperatorLabelText = currentOperatorLabel.text.unwrapped
        
        allOperations.append(currentOperatorLabelText)
        allOperations.append(currentNumberLabelText)
        
        if allOperations.isEmpty != true {
            addInputStack()
            let mergedAllOperation = allOperations.joined(separator: CalculatorConstant.whiteSpace)
            let validOperation = removeComma(from: mergedAllOperation)
            let formula = ExpressionParser.parse(from: validOperation)
            let result = formula.result()
            
            setLabels(numberText: String(result).numberFomatter())
            allOperations = []
        }
    }
    
    override func viewDidLoad() {
        setLabels(numberText: CalculatorConstant.defaultNumber)
    }
    
    private func removeComma(from input: String) -> String {
        return input.replacingOccurrences(of: CalculatorConstant.comma, with: CalculatorConstant.blank)
    }
    
    private func isvalidLength(texts: [String], maximumLength: Int) -> Bool {
        let textCount = texts.reduce(0) { $0 + removeComma(from: $1).count }
        
        return textCount <= maximumLength
    }
    
    private func clearAllHistory() {
        calculatorStackView.subviews.forEach { $0.removeFromSuperview() }
        setLabels()
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
        numberStackLabel.textColor = .white
        
        operatorStackLabel.font = .preferredFont(forTextStyle: UIFont.TextStyle.title3)
        numberStackLabel.font = .preferredFont(forTextStyle: UIFont.TextStyle.title3)
        
        operatorStackLabel.text = `operator`
        numberStackLabel.text = number
        
        return (operatorStackLabel, numberStackLabel)
    }
    
    private func setLabels(numberText: String = CalculatorConstant.defaultNumber, operatorText: String = CalculatorConstant.blank) {
        currentNumberLabel.text = numberText
        currentOperatorLabel.text = operatorText
    }
    
    private func setScrollViewLayout() {
        guard let scrollView = calculatorStackView.superview as? UIScrollView else {
            return
        }
        scrollView.layoutIfNeeded()
        
        scrollView
            .setContentOffset(
                CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.height),
                animated: true
            )
    }
}


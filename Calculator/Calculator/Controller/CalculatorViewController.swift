//
//  Calculator - ViewController.swift
//  Created by Tiana, Eddy and Red
//  Copyright © yagom. All rights reserved.
// 

import UIKit

fileprivate enum Const {
    static let blank: String = ""
    static let initialNumber: String = " 0"
    static let dot: String = "."
    static let comma: String = ","
    static let whiteSpace: String = " "
    static let minus: Character = "-"
    static let maximumLength: Int = 20
}

final class CalculatorViewController: UIViewController {
    private var allOperations: [String] = []
    
    @IBOutlet weak var calculatorStackView: UIStackView!
    @IBOutlet weak var currentOperatorLabel: UILabel!
    @IBOutlet weak var currentNumberLabel: UILabel!
    
    @IBAction func touchUpNumberButton(_ sender: UIButton) {
        let currentNumberLabelText = currentNumberLabel.text.unwrapped
        let buttonTitle = sender.currentTitle.unwrapped
        var updatedNumber: String
        guard isValidLength(texts: [currentNumberLabelText, buttonTitle], maximumLength: Const.maximumLength) else { return }
        
        if currentNumberLabelText == Const.initialNumber {
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
        guard currentNumberLabelText != Const.initialNumber else {
            setLabels(operatorText: buttonTitle)
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
        guard currentNumberLabel.text?.contains(Const.dot) == true else {
            currentNumberLabel.text = currentNumberLabelText + Const.dot
            return
        }
    }
    
    @IBAction func touchUpZeroButton(_ sender: UIButton) {
        let currentNumberLabelText = currentNumberLabel.text.unwrapped
        let buttonTitle = sender.currentTitle.unwrapped
        let updatedText = currentNumberLabelText + buttonTitle
        guard isValidLength(
            texts: [currentNumberLabelText, buttonTitle],
            maximumLength: Const.maximumLength
        ) else { return }
        
        if currentNumberLabelText.contains(Const.dot) == true {
            currentNumberLabel.text = updatedText
        } else {
            currentNumberLabel.text = updatedText.numberFomatter()
        }
    }
    
    @IBAction func touchUpPlusMinusSignButton(_ sender: UIButton) {
        var currentNumberLabelText = currentNumberLabel.text.unwrapped
        guard currentNumberLabelText.first != Character(Const.whiteSpace),
              currentNumberLabelText.first != "0" else {
            return
        }
        
        switch currentNumberLabelText.first {
        case Const.minus:
            currentNumberLabelText.removeFirst()
        default:
            currentNumberLabelText.insert(Const.minus,
                                          at: currentNumberLabelText.startIndex)
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
            currentNumberLabel.text = Const.initialNumber
        }
    }

    @IBAction func touchUpCalculateButton(_ sender: UIButton) {
        guard allOperations.count >= 1 else {
            return
        }
        
        let currentNumberLabelText = currentNumberLabel.text.unwrapped
        let currentOperatorLabelText = currentOperatorLabel.text.unwrapped
        
        allOperations.append(currentOperatorLabelText)
        allOperations.append(currentNumberLabelText)
        
        addInputStack()
        
        let mergedAllOperation = allOperations.joined(
            separator: Const.whiteSpace
        )
        let validOperation = mergedAllOperation.withoutComma
        let formula = ExpressionParser.parse(from: validOperation)
        let result = formula.result()
        
        if result.isNaN {
            setLabels(numberText: "NaN")
        } else {
            setLabels(numberText: String(result).numberFomatter())
        }
        allOperations = []
    }
    
    override func viewDidLoad() {
        setLabels(numberText: Const.initialNumber)
    }
    
    private func isValidLength(texts: [String], maximumLength: Int) -> Bool {
        let textCount = texts.reduce(0) { $0 + $1.withoutComma.count }
        
        return textCount <= maximumLength
    }
    
    private func clearAllHistory() {
        calculatorStackView.subviews.forEach { $0.removeFromSuperview() }
        setLabels()
    }
    
    private func addInputStack() {
        guard let stack = generateStack() else { return }
        
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
        var `operator` = currentOperatorLabel.text.unwrapped
        var number = currentNumberLabel.text.unwrapped
        let operatorStackLabel = UILabel()
        let numberStackLabel = UILabel()
        
        operatorStackLabel.textColor = .white
        operatorStackLabel.font = .preferredFont(forTextStyle: UIFont.TextStyle.title3)
        
        if calculatorStackView.subviews.isEmpty {
            `operator` = Const.blank
        }
        operatorStackLabel.text = `operator`
        
        numberStackLabel.textColor = .white
        numberStackLabel.font = .preferredFont(forTextStyle: UIFont.TextStyle.title3)
        
        numberStackLabel.text = number
        
        return (operatorStackLabel, numberStackLabel)
    }
    
    private func setLabels(numberText: String = Const.initialNumber,
                           operatorText: String = Const.blank) {
        currentNumberLabel.text = numberText
        currentOperatorLabel.text = operatorText
    }
    
    private func setScrollViewLayout() {
        guard let scrollView = calculatorStackView.superview as? UIScrollView else {
            return
        }
        let hiddenHeight = scrollView.contentSize.height - scrollView.bounds.height
        
        scrollView.layoutIfNeeded()
        scrollView.setContentOffset(CGPoint(x: .zero, y: hiddenHeight), animated: true)
    }
}


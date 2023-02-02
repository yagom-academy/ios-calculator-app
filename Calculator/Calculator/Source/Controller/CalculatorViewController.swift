//
//  Calculator - ViewController.swift
//  Created by Harry.
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var displayOperatorLabel: UILabel!
    @IBOutlet private weak var displayNumbersLabel: UILabel!
    @IBOutlet private weak var historyScrollView: UIScrollView!
    @IBOutlet private weak var historyStackView: UIStackView!
    
    private var expression: [String] = [String]()
    private var isCalculated: Bool = false
    
    private var currentNumbersLabelText: String = "0" {
        didSet {
            let numberText = currentNumbersLabelText
            if currentNumbersLabelText.count > 20 {
                let truncatedText = String(numberText.suffix(20))
                displayNumbersLabel.text = truncatedText
            } else {
                displayNumbersLabel.text = currentNumbersLabelText
            }
        }
    }
    private var currentOperatorLabelText: String = "" {
        didSet {
            displayOperatorLabel.text = currentOperatorLabelText
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func numericButtonTapped(_ sender: UIButton) {
        guard let number = sender.currentTitle else { return }
        guard isCalculated == false else { return }
        
        if currentNumbersLabelText == "0" {
            currentNumbersLabelText = number
        } else {
            currentNumbersLabelText += number
        }
    }
    
    @IBAction private func doubleZeroButtonTapped(_ sender: UIButton) {
        guard currentNumbersLabelText != "0" else { return }
        guard let doubleZero = sender.currentTitle else { return }
        
        currentNumbersLabelText += doubleZero
    }
    
    @IBAction private func dotButtonTapped(_ sender: UIButton) {
        guard let dot = sender.currentTitle else { return }
        guard !currentNumbersLabelText.contains(".") else { return }
        
        currentNumbersLabelText += dot
    }
    
    @IBAction private func operatorButtonTapped(_ sender: UIButton) {
        guard let `operator` = sender.currentTitle else { return }
        
        if isCalculated {
            guard let continuedText = displayNumbersLabel.text?
                .components(separatedBy: ",")
                .joined() else { return }
            
            expression.append(continuedText)
            addHistoryEntry(left: "", right: continuedText)
            currentOperatorLabelText = `operator`
            isCalculated = false
            return
        }
        
        if currentNumbersLabelText == "0" {
            if currentOperatorLabelText == "" {
                return
            } else if currentOperatorLabelText != "" {
                currentOperatorLabelText = `operator`
                return
            }
        }
        
        if currentOperatorLabelText != "" {
            expression.append(currentOperatorLabelText)
        }
        
        expression.append(currentNumbersLabelText)
        addHistoryEntry(left: currentOperatorLabelText, right: currentNumbersLabelText)
        currentOperatorLabelText = `operator`
        currentNumbersLabelText = "0"
    }
    
    @IBAction private func calculateButtonTapped(_ sender: UIButton) {
        guard expression.isEmpty == false else { return }
        //guard currentNumbersLabelText != "0" else { return }
        
        expression.append(currentOperatorLabelText)
        expression.append(currentNumbersLabelText)
        addHistoryEntry(left: currentOperatorLabelText, right: currentNumbersLabelText)
        
        let flatenedExpression: String = expression.joined(separator: " ")
        
        var formula = ExpressionParser.parse(from: flatenedExpression)
        let result = formula.result()
        
        if result.isNaN {
            clearAfterCalculate()
            displayNumbersLabel.text = "NaN"
        } else {
            clearAfterCalculate()
            displayNumbersLabel.text = convertFormattedString(text: String(result))
        }
    }
    
    private func clearAfterCalculate() {
        currentOperatorLabelText = ""
        currentNumbersLabelText = "0"
        expression.removeAll()
        isCalculated = true
    }
    
    @IBAction private func signToggleButtonTapped(_ sender: UIButton) {
        guard currentNumbersLabelText != "0" else { return }
        
        if currentNumbersLabelText.first == "-" {
            currentNumbersLabelText.removeFirst()
        } else {
            currentNumbersLabelText = "-" + currentNumbersLabelText
        }
    }
    
    @IBAction private func allClearButtonTapped(_ sender: UIButton) {
        expression.removeAll()
        currentOperatorLabelText = ""
        currentNumbersLabelText = "0"
        isCalculated = false
        historyStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    @IBAction private func clearEntryButtonTapped(_ sender: UIButton) {
        currentNumbersLabelText = "0"
        isCalculated = false
    }
    
    private func addHistoryEntry(left: String, right: String) {
        let historyEntryStackView = HistoryViewGenerator
            .generateStackView(operator: left, operand: right)
        historyEntryStackView.isHidden = true
        
        historyStackView.addArrangedSubview(historyEntryStackView)
        
        UIView.animate(withDuration: 0.3) {
            historyEntryStackView.isHidden = false
        }
        scrollToBottom()
    }
    
    private func convertFormattedString(text: String) -> String {
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.roundingMode = .halfUp
        numberFormatter.usesSignificantDigits = true
        numberFormatter.maximumSignificantDigits = 20
        
        guard let formattedNumber = numberFormatter
            .string(for: Decimal(string: text)) else { return text }
        return formattedNumber
    }
    
    private func scrollToBottom() {
        let bottomOffset = CGPoint(x: 0, y: historyScrollView.contentSize.height - historyScrollView.bounds.height + historyScrollView.contentInset.bottom)
        historyScrollView.setContentOffset(bottomOffset, animated: true)
    }
}

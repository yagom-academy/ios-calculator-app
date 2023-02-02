//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var displayOperatorLabel: UILabel!
    @IBOutlet private weak var displayNumbersLabel: UILabel!
    @IBOutlet private weak var historyScrollView: UIScrollView!
    @IBOutlet private weak var historyStackView: UIStackView!
    
    private var expression: [String] = [String]()
    private var numberFormatter: NumberFormatter = NumberFormatter()
    private var isCalculated: Bool = false
    
    private var currentNumbersLabelText: String = "0" {
        didSet {            
            if currentNumbersLabelText.count > 20 {
                let numberText = String(currentNumbersLabelText.suffix(20))
                let formattedNumber = numberFormatter.string(for: Decimal(string: numberText))
                displayNumbersLabel.text = formattedNumber
            } else {
                let formattedNumber = numberFormatter.string(for: Decimal(string: currentNumbersLabelText))
                displayNumbersLabel.text = formattedNumber
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
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 20
    }
    
    @IBAction private func numericButtonTapped(_ sender: UIButton) {
        guard let number = sender.currentTitle else { return }
        
        if currentNumbersLabelText == "0" {
            currentNumbersLabelText = number
        } else {
            currentNumbersLabelText += number
        }
    }
    
    @IBAction private func doubleZeroButtonTapped(_ sender: UIButton) {
        guard currentNumbersLabelText != "0" else { return }
        guard let number = sender.currentTitle else { return }
        currentNumbersLabelText += number
    }
    
    @IBAction private func operatorButtonTapped(_ sender: UIButton) {
        guard let `operator` = sender.currentTitle else { return }
        
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
        scrollToBottom()
    }
    
    @IBAction private func calculateButtonTapped(_ sender: UIButton) {
        guard expression.isEmpty == false else { return }
        guard currentNumbersLabelText != "0" else { return }
        
        expression.append(currentOperatorLabelText)
        expression.append(currentNumbersLabelText)
        addHistoryEntry(left: currentOperatorLabelText, right: currentNumbersLabelText)
        
        let flatenedExpression: String = expression.joined(separator: " ")
        
        var formula = ExpressionParser.parse(from: flatenedExpression)
        let result = formula.result()
        
        if result.isNaN {
            currentNumbersLabelText = "NaN"
        } else {
            currentOperatorLabelText = ""
            expression.removeAll()
            currentNumbersLabelText = String(result)
        }
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
        historyStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    @IBAction private func clearEntryButtonTapped(_ sender: UIButton) {
        currentNumbersLabelText = "0"
    }
    
    private func addHistoryEntry(left: String, right: String) {
        let historyEntryStackView = HistoryViewGenerator
            .generateStackView(operator: left, operand: right)
        historyEntryStackView.isHidden = true
        
        historyStackView.addArrangedSubview(historyEntryStackView)
        
        UIView.animate(withDuration: 0.3) {
            historyEntryStackView.isHidden = false
        }
    }
    
    private func scrollToBottom() {
        let bottomOffset = CGPoint(x: 0, y: historyScrollView.contentSize.height - historyScrollView.bounds.height + historyScrollView.contentInset.bottom)
        historyScrollView.setContentOffset(bottomOffset, animated: true)
    }
}

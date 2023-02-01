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
    
    private var numberFormatter: NumberFormatter = .init()
    private var currentNumbersLabelText: String = "0" {
        didSet {
            displayNumbersLabel.text = numberFormatter.string(for: Double(currentNumbersLabelText))
        }
    }
    private var prevOperatorLabelText: String = ""
    private var currentOperatorLabelText: String = "" {
        didSet {
            displayOperatorLabel.text = currentOperatorLabelText
        }
    }
    
    private var isFirstAction: Bool = true
    private var expression: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberFormatter.numberStyle = .decimal
    }
    
    @IBAction private func numericButtonTapped(_ sender: UIButton) {
        guard let number = sender.currentTitle else { return }
        
        if currentNumbersLabelText == "0" {
            currentNumbersLabelText = number
        } else {
            currentNumbersLabelText += number
        }
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
    }
    
    @IBAction private func clearEntryButtonTapped(_ sender: UIButton) {
        currentNumbersLabelText = "0"
    }
    
    func addHistoryEntry(left: String, right: String) {
        let historyEntryStackView = HistoryViewGenerator.generateStackView(operator: left, operand: right)
        historyEntryStackView.isHidden = true
        
        historyStackView.addArrangedSubview(historyEntryStackView)
        
        UIView.animate(withDuration: 0.3) {
            historyEntryStackView.isHidden = false
        }
    }
    
    
}


//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

struct CalculatorItems {
    private init() { }
    
    fileprivate static let zero = "0"
    fileprivate static let doubleZero = "00"
    fileprivate static let negativeSign = "-"
    fileprivate static let dot = "."
    fileprivate static let comma = ","
    fileprivate static let nan = "NaN"
    fileprivate static let empty = ""
}

class ViewController: UIViewController {
    @IBOutlet private weak var currentEntryLabel: UILabel!
    @IBOutlet private weak var currentOperatorLabel: UILabel!
    @IBOutlet private weak var componentsStackView: UIStackView!
    @IBOutlet private weak var scrollView: UIScrollView!
    
    private var formula: String = CalculatorItems.empty
    private var calculateResult: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetCurrentEntry()
        resetOperatorLabel()
        resetScrollView()
    }
    
    @IBAction private func clearEntryButtonPressed(_ sender: UIButton) {
        resetCurrentEntry()
    }
    
    @IBAction private func signChangeButtonPressed(_ sender: UIButton) {
        guard var currentEntry = currentEntryLabel.text,
              currentEntry != CalculatorItems.zero else { return }
        
        if currentEntry.starts(with: CalculatorItems.negativeSign) {
            currentEntry.removeFirst()
        } else {
            currentEntry.insert(Character(CalculatorItems.negativeSign), at: currentEntry.startIndex)
        }
        
        currentEntryLabel.text = currentEntry
    }
    
    @IBAction private func operandButtonPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0...9:
            updateEntry(using: sender.tag.description)
        case 10:
            updateEntry(using: CalculatorItems.doubleZero)
        case 11:
            updateEntry(using: CalculatorItems.dot)
        default:
            return
        }
    }

    @IBAction private func operatorButtonPressed(_ sender: UIButton) {
        guard var operand = currentEntryLabel.text, operand != CalculatorItems.zero ||
              !componentsStackView.subviews.isEmpty else { return }
        
        if let last = operand.last, operand != CalculatorItems.zero {
            if last == Character(CalculatorItems.dot) {
                operand.removeLast()
            }
            formula += "\(currentOperatorLabel.text ?? CalculatorItems.empty) \(operand) "
            addFormula(operand: operand)
        }
        
        currentOperatorLabel.text = sender.currentTitle
        resetCurrentEntry()
    }
    
    @IBAction private func allClearButtonPressed(_ sender: UIButton) {
        resetScrollView()
        resetOperatorLabel()
        resetCurrentEntry()
        resetFormula()
    }
    
    @IBAction private func calculateButtonPressed(_ sender: UIButton) {
        guard !componentsStackView.subviews.isEmpty else { return }
        guard let operand = currentEntryLabel.text,
              operand != calculateResult?.description else { return }
        
        formula += "\(currentOperatorLabel.text ?? CalculatorItems.empty) \(operand) "
        addFormula(operand: operand)
        
        do {
            let result = try calculate(input: formula)
            let formattedResult = result.description.formatNumberToDecimal()
            
            currentEntryLabel.text = formattedResult
            calculateResult = formattedResult
            resetOperatorLabel()
            resetFormula()
        } catch CalculatorError.dividedByZero {
            currentEntryLabel.text = CalculatorItems.nan
            resetOperatorLabel()
            resetFormula()
        } catch {
            print(error)
        }
    }
    
    private func resetOperatorLabel() {
        currentOperatorLabel.text = CalculatorItems.empty
    }
    
    private func resetCurrentEntry() {
        currentEntryLabel.text = CalculatorItems.zero
    }
    
    private func resetScrollView() {
        componentsStackView.subviews.forEach { $0.removeFromSuperview() }
    }
    
    private func resetFormula() {
        formula = CalculatorItems.empty
    }
    
    private func updateEntry(using input: String) {
        guard var currentEntry = currentEntryLabel.text,
                  currentEntry != CalculatorItems.zero || input != CalculatorItems.doubleZero else { return }
        guard input != CalculatorItems.dot || !currentEntry.contains(input) else { return }
        
        currentEntry += input
        
        if currentEntry.starts(with: CalculatorItems.zero) {
            if !currentEntry.starts(with: CalculatorItems.zero + CalculatorItems.dot) {
                currentEntry.removeFirst()
            }
        }
        
        if input != CalculatorItems.dot {
            guard let convertedEntry = currentEntry.formatNumberToDecimal() else { return }
            currentEntryLabel.text = convertedEntry
        } else {
            currentEntryLabel.text = currentEntry
        }
    }
    
    private func addLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .title3)
        
        return label
    }
    
    private func addStackView(operandLabel: UILabel, operatorLabel: UILabel) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [operatorLabel, operandLabel])
        stackView.spacing = 8
        
        return stackView
    }
    
    private func addFormula(operand: String) {
        let operatorLabel = addLabel(text: currentOperatorLabel.text ?? CalculatorItems.empty)
        let operandLabel = addLabel(text: operand)
        componentsStackView.addArrangedSubview(addStackView(operandLabel: operandLabel, operatorLabel: operatorLabel))
    }
    
    private func calculate(input: String) throws -> Double {
        let inputWithoutComma = input.replacingOccurrences(of: CalculatorItems.comma, with: CalculatorItems.empty)
        let formula = ExpressionParser.parse(from: inputWithoutComma)

        return try formula.result()
    }
}


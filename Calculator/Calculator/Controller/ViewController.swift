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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetCurrentEntry()
        resetOperatorLabel()
        componentsStackView.arrangedSubviews.forEach({
            $0.removeFromSuperview()
        })
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
        guard let operand = currentEntryLabel.text, operand != CalculatorItems.zero ||
              !componentsStackView.subviews.isEmpty else { return }
        
        if operand != CalculatorItems.zero {
            addFormula(operand: operand)
        }
        
        currentOperatorLabel.text = sender.currentTitle
        resetCurrentEntry()
    }
    
    @IBAction private func allClearButtonPressed(_ sender: UIButton) {
        componentsStackView.subviews.forEach { $0.removeFromSuperview() }
        resetOperatorLabel()
        resetCurrentEntry()
    }
    
    @IBAction private func calculateButtonPressed(_ sender: UIButton) {
        guard !componentsStackView.subviews.isEmpty else { return }
        guard let operand = currentEntryLabel.text else { return }
        
        var formulaInput: String = CalculatorItems.empty
        
        addFormula(operand: operand)
        
        componentsStackView.subviews.forEach { $0.subviews.forEach({
            if let label = $0 as? UILabel, let text = label.text, !text.isEmpty {
                formulaInput += "\(text) "
            }
        }) }
        
        do {
            let result = try calculate(input: formulaInput)
            currentEntryLabel.text = result.description.formatNumberToDecimal()
            resetOperatorLabel()
            componentsStackView.subviews.forEach { $0.removeFromSuperview() }
        } catch CalculatorError.dividedByZero {
            currentEntryLabel.text = CalculatorItems.nan
            resetOperatorLabel()
            componentsStackView.subviews.forEach { $0.removeFromSuperview() }
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
        
        return label
    }
    
    private func addStackView(operandLabel: UILabel, operatorLabel: UILabel) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [operatorLabel, operandLabel])
        stackView.spacing = 10
        
        return stackView
    }
    
    private func addFormula(operand: String) {
        let operatorLabel = addLabel(text: currentOperatorLabel.text ?? CalculatorItems.empty)
        let operandLabel = addLabel(text: operand)
        componentsStackView.addArrangedSubview(addStackView(operandLabel: operandLabel, operatorLabel: operatorLabel))
    }
    
    private func calculate(input: String) throws -> Double {
        let formula = ExpressionParser.parse(from: input)
        
        return try formula.result()
    }
}


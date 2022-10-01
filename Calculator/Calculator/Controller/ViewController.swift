//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var subtractButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var allClearButton: UIButton!
    @IBOutlet weak var clearEntryButton: UIButton!
    @IBOutlet weak var signChangeButton: UIButton!
    @IBOutlet weak var currentEntryLabel: UILabel!
    @IBOutlet weak var currentOperatorLabel: UILabel!
    @IBOutlet weak var componentsStackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetCurrentEntry()
        resetOperatorLabel()
        componentsStackView.arrangedSubviews.forEach({
            $0.removeFromSuperview()
        })
    }
    
    @IBAction func clearEntryButtonPressed(_ sender: UIButton) {
        resetCurrentEntry()
    }
    
    @IBAction func signChangeButtonPressed(_ sender: UIButton) {
        guard var currentEntry = currentEntryLabel.text,
                  currentEntry != "0" else { return }
        
        if currentEntry.starts(with: "-") {
            currentEntry.removeFirst()
        } else {
            currentEntry.insert("-", at: currentEntry.startIndex)
        }
        
        currentEntryLabel.text = currentEntry
    }
    
    @IBAction func operandButtonPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0...9:
            updateEntry(using: sender.tag.description)
        case 10:
            updateEntry(using: "00")
        case 11:
            updateEntry(using: ".")
        default:
            return
        }
    }

    @IBAction func operatorButtonPressed(_ sender: UIButton) {
        guard let operand = currentEntryLabel.text, operand != "0" ||
              !componentsStackView.subviews.isEmpty else { return }
        
        if operand != "0" {
            let operatorLabel = addLabel(text: currentOperatorLabel.text ?? "")
            let operandLabel = addLabel(text: operand)
            componentsStackView.addArrangedSubview(addStackView(operandLabel: operandLabel, operatorLabel: operatorLabel))
        }
        
        currentOperatorLabel.text = sender.currentTitle
        resetCurrentEntry()
    }
    
    @IBAction func allClearButtonPressed(_ sender: UIButton) {
        componentsStackView.subviews.forEach { $0.removeFromSuperview() }
        resetOperatorLabel()
    }
    
    func resetOperatorLabel() {
        currentOperatorLabel.text = ""
    }
    
    func resetCurrentEntry() {
        currentEntryLabel.text = "0"
    }
    
    func updateEntry(using input: String) {
        guard var currentEntry = currentEntryLabel.text,
                  currentEntry != "0" || input != "00" else { return }
        guard input != "." || !currentEntry.contains(input) else { return }
        
        currentEntry += input
        
        if currentEntry.starts(with: "0") {
            if !currentEntry.starts(with: "0.") {
                currentEntry.removeFirst()
            }
        }
        
        if input != "." {
            guard let convertedEntry = formatNumber(input: currentEntry) else { return }
            currentEntryLabel.text = convertedEntry
        } else {
            currentEntryLabel.text = currentEntry
        }
    }
    
    func formatNumber(input: String) -> String? {
        let inputWithoutComma = input.replacingOccurrences(of: ",", with: "")
        guard let convertedInput = Double(inputWithoutComma) else { return nil }
        
        let numberFormatter = NumberFormatter()
        numberFormatter.roundingMode = .ceiling
        numberFormatter.maximumSignificantDigits = 20
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(for: convertedInput)
    }
    
    func addLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .white
        
        return label
    }
    
    func addStackView(operandLabel: UILabel, operatorLabel: UILabel) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [operatorLabel, operandLabel])
        stackView.spacing = 10
        
        return stackView
    }
}


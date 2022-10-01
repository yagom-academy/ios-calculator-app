//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var calculatorDisplayLabel: UILabel!
    @IBOutlet private weak var operatorDisplayLabel: UILabel!
    @IBOutlet private weak var calculatorArchive: UIStackView!

    @IBOutlet private weak var scrollView: UIScrollView!
    
    private var displayLabelText: String = namespace.Zero {
        didSet {
            if displayLabelText.count >= 20 {
                let index = displayLabelText.index(displayLabelText.startIndex, offsetBy: 19)
                displayLabelText = String(displayLabelText[...index])
                if displayLabelText.last == "." {
                    displayLabelText.removeLast()
                }
            }
            
            calculatorDisplayLabel.text = displayLabelText
            
            guard let convertedTextToDouble = Double(displayLabelText) else {
                return
            }
            
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            calculatorDisplayLabel.text = numberFormatter.string(from: convertedTextToDouble as NSNumber)
        }
    }
    
    private(set) var formula: String = namespace.Empty
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAccessibilityIdentifier()
    }
    
    private func setAccessibilityIdentifier() {
        calculatorDisplayLabel.isAccessibilityElement = true
        calculatorDisplayLabel.accessibilityIdentifier = accessibilityIdentifier.CalculatorDisplayLabel
        
        operatorDisplayLabel.isAccessibilityElement = true
        operatorDisplayLabel.accessibilityIdentifier = accessibilityIdentifier.OperatorDisplayLabel
        
        calculatorArchive.isAccessibilityElement = true
        calculatorArchive.accessibilityIdentifier = accessibilityIdentifier.CalculatorArchive
    }

    @IBAction private func numberButtonTapped(_ sender: UIButton) {
        guard let titleText = sender.currentTitle,
              displayLabelText != namespace.NaN else {
            return
        }
        
        if displayLabelText == namespace.Zero {
            displayLabelText = titleText
        } else {
            displayLabelText = displayLabelText + titleText
        }
    }
    
    @IBAction private func zeroButtonTapped(_ sender: UIButton) {
        guard let titleText = sender.currentTitle,
              displayLabelText != namespace.NaN else {
            return
        }
        
        if displayLabelText != namespace.Zero {
            displayLabelText = displayLabelText + titleText
        }
    }
    
    @IBAction private func dotButtonTapped(_ sender: UIButton) {
        guard let titleText = sender.currentTitle,
              displayLabelText != namespace.NaN else {
            return
        }
        
        displayLabelText = displayLabelText + titleText
    }
    
    @IBAction private func operatorButtonTapped(_ sender: UIButton) {
        guard let titleText = sender.currentTitle,
              let displayText = calculatorDisplayLabel.text,
              let operatorText = operatorDisplayLabel.text else {
            return
        }
        
        if displayLabelText != namespace.Zero {
            pushInFormula(operand: displayLabelText, operator: operatorText)
            pushInArchive(operand: displayText, operator: operatorText)
        }
        
        if self.formula.isEmpty == false {
            operatorDisplayLabel.text = titleText
        }
        
        displayLabelText = namespace.Zero
    }
    
    private func pushInFormula(operand: String, `operator`: String) {
        if self.formula.isEmpty {
            self.formula += operand
        } else {
            self.formula += `operator` + operand
        }
    }
    
    private func pushInArchive(operand: String, `operator`: String) {
        let generator = StackViewCell(operand: operand, operator: `operator`)
        let stackView = generator.generateStackView()
        
        calculatorArchive.addArrangedSubview(stackView)
        
        scrollToBottom()
    }
    
    private func scrollToBottom() {
        self.scrollView.layoutIfNeeded()
        let bottomOffset = CGPoint(x: 0, y: self.scrollView.contentSize.height - self.scrollView.bounds.size.height)
        self.scrollView.setContentOffset(bottomOffset, animated: true)
    }
    
    @IBAction private func changeSignButtonTapped(_ sender: UIButton) {
        if displayLabelText != namespace.Zero {
            displayLabelText = changeSign(displayLabelText)
        }
    }
    
    private func changeSign(_ text: String) -> String {
        if text.first == Character(namespace.Negative) {
            let secondIndex = text.index(after: text.startIndex)
            return String(text[secondIndex...])
        } else {
            return namespace.Negative + text
        }
    }
    
    @IBAction private func clearEntryButtonTapped(_ sender: UIButton) {
        displayLabelText = namespace.Zero
    }
    
    @IBAction private func allClearButtonTapped(_ sender: UIButton) {
        displayLabelText = namespace.Zero
        operatorDisplayLabel.text = namespace.Empty
        self.formula = namespace.Empty
        
        resetArchive()
    }
    
    private func resetArchive() {
        calculatorArchive.arrangedSubviews.forEach { view in
            view.removeFromSuperview()
        }
    }
    
    @IBAction private func calculateButtonTapped(_ sender: UIButton) {
        guard let operatorText = operatorDisplayLabel.text,
              self.formula != namespace.Empty else {
            return
        }
        
        pushInFormula(operand: displayLabelText, operator: operatorText)
        pushInArchive(operand: displayLabelText, operator: operatorText)
        
        var parsedFormula = ExpressionParser.parse(from: formula)
        
        do {
            let result = try parsedFormula.result()
            displayLabelText = String(result)
            
            self.formula = namespace.Empty
            operatorDisplayLabel.text = namespace.Empty
        } catch CalculatorError.divideZero {
            displayLabelText = namespace.NaN
        } catch {
            print(error.localizedDescription)
        }
    }
}


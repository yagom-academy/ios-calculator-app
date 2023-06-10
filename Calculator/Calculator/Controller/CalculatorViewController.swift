//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    // MARK: - IBOutlet
    
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var calculateItemsStack: UIStackView!
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var operandLabel: UILabel!
    
    // MARK: - Property
    
    private var components: String = ""
    
    // MARK: - View State Method

    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
    }
    
    // MARK: - IBAction
    
    @IBAction private func tapACButton(_ sender: Any) {
        clearAll()
    }

    @IBAction private func tapCEButton(_ sender: Any) {
        clearEntry()
    }

    @IBAction private func tapNEGButton(_ sender: Any) {
        toggleNegativeNumber()
    }

    @IBAction private func tapOperatorButton(_ sender: UIButton) {
        guard !components.isEmpty || (operandLabel.text != "0") else {
            return
        }
        
        guard formatNumber(of: Decimal(string: operandLabel.text ?? "")) != "0" else {
            operatorLabel.text = sender.titleLabel?.text
            return
        }
        
        appendCalculateItem()
        
        operatorLabel.text = sender.titleLabel?.text
        clearEntry()
    }

    @IBAction private func tapNumberButton(_ sender: UIButton) {
        let operandLabelText = removeComma(of: operandLabel.text)
        
        guard var operandLabelText, operandLabelText.count < 20 else {
            return
        }
        
        operandLabelText.append(sender.titleLabel?.text ?? "")
        let number = Decimal(string: operandLabelText)
        
        operandLabel.text = formatNumber(of: number)
    }

    @IBAction private func tapZeroButton(_ sender: UIButton) {
        guard
            let operandLabelText = operandLabel.text,
            operandLabelText != "0" || operandLabelText.contains("."),
            operandLabelText.count < 20
        else {
            return
        }
        
        operandLabel.text?.append(sender.titleLabel?.text ?? "")
    }

    @IBAction private func tapDotButton(_ sender: UIButton) {
        guard
            let operandLabelText = operandLabel.text,
            !operandLabelText.contains(".")
        else {
            return
        }
        
        operandLabel.text?.append(".")
    }

    @IBAction private func tapEqualsButton(_ sender: Any) {
        guard !components.isEmpty else {
            return
        }
        
        do {
            appendCalculateItem()
            var formula = ExpressionParser.parse(from: components)
            let result = try formula.result()
            operandLabel.text = formatNumber(of: result)
            clearOperator()
            components = ""
        } catch let error as CalculatorError {
            switch error {
            case .divisionError:
                print(error.message)
                clearOperator()
                components = ""
                operandLabel.text = "NaN"
            }
        } catch {
            print("알 수 없는 에러 발생")
        }
    }

    // MARK: - Method
    
    private func formatNumber(of number: Any?) -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 20
        
        return numberFormatter.string(for: number)
    }
    
    private func clearAll() {
        calculateItemsStack.arrangedSubviews.forEach { view in
            view.removeFromSuperview()
        }
        
        clearOperator()
        clearEntry()
        components = ""
    }
    
    private func clearOperator() {
        operatorLabel.text = nil
    }
    
    private func clearEntry() {
        operandLabel.text = "0"
    }
    
    private func toggleNegativeNumber() {
        guard var operandLabelText = operandLabel.text, operandLabelText != "0" else {
            return
        }
        
        if operandLabelText.contains("-") {
            operandLabelText.removeFirst()
        } else {
            operandLabelText = "-\(operandLabelText)"
        }
        
        operandLabel.text = operandLabelText
    }
    
    private func appendCalculateItem() {
        guard let operandLabelText = removeComma(of: operandLabel.text) else {
            return
        }
        
        let operatorLabel = UILabel()
        let operandLabel = UILabel()
        
        operatorLabel.textColor = .white
        operandLabel.textColor = .white
        
        operatorLabel.text = self.operatorLabel.text
        operandLabel.text = formatNumber(of: Decimal(string: operandLabelText))
        
        if operandLabel.text?.last == "." {
            operandLabel.text?.removeLast()
        }
        
        let calculateItemStack = UIStackView()
        calculateItemStack.axis = .horizontal
        calculateItemStack.spacing = 8.0
        calculateItemStack.addArrangedSubview(operatorLabel)
        calculateItemStack.addArrangedSubview(operandLabel)
        
        calculateItemsStack.addArrangedSubview(calculateItemStack)
        
        components.append(operatorLabel.text ?? "")
        components.append(operandLabel.text ?? "")
        
        scrollToBottom()
    }
    
    private func removeComma(of text: String?) -> String? {
        return text?.components(separatedBy: ",").joined()
    }
    
    private func scrollToBottom() {
        scrollView.layoutIfNeeded()
        
        let bottomOffset = CGPoint(
            x: 0,
            y: scrollView.contentSize.height
            - scrollView.bounds.height
            + scrollView.contentInset.bottom
        )
        
        scrollView.setContentOffset(bottomOffset, animated: true)
    }
}


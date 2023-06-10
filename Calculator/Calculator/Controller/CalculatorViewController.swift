//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class CalculatorViewController: UIViewController {
    // MARK: - IBOutlet
    
    @IBOutlet private weak var calculateItemsStackViewScrollView: UIScrollView!
    @IBOutlet private weak var calculateItemsStackView: UIStackView!
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var operandLabel: UILabel!
    
    // MARK: - Property
    
    private var operatorsAndOperandsInput: String = ""
    
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
        toggleSingOfOperand()
    }

    @IBAction private func tapOperatorButton(_ sender: UIButton) {
        guard !operatorsAndOperandsInput.isEmpty || (operandLabel.text != "0") else {
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
        guard
            var operandLabelText = removeComma(of: operandLabel.text),
            operandLabelText.count < 20
        else {
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
        guard !operatorsAndOperandsInput.isEmpty else {
            return
        }
        
        do {
            appendCalculateItem()
            var formula = ExpressionParser.parse(from: operatorsAndOperandsInput)
            let result = try formula.result()
            operandLabel.text = formatNumber(of: result)
            clearOperator()
            operatorsAndOperandsInput = ""
        } catch let error as CalculatorError {
            switch error {
            case .divisionError:
                print(error.message)
                clearOperator()
                operatorsAndOperandsInput = ""
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
        calculateItemsStackView.arrangedSubviews.forEach { view in
            view.removeFromSuperview()
        }
        
        clearOperator()
        clearEntry()
        operatorsAndOperandsInput = ""
    }
    
    private func clearOperator() {
        operatorLabel.text = nil
    }
    
    private func clearEntry() {
        operandLabel.text = "0"
    }
    
    private func toggleSingOfOperand() {
        guard
            var operandLabelText = operandLabel.text,
            operandLabelText != "0"
        else {
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
        
        calculateItemsStackView.addArrangedSubview(calculateItemStack)
        
        operatorsAndOperandsInput.append(operatorLabel.text ?? "")
        operatorsAndOperandsInput.append(operandLabel.text ?? "")
        
        scrollToBottom()
    }
    
    private func removeComma(of text: String?) -> String? {
        return text?.components(separatedBy: ",").joined()
    }
    
    private func scrollToBottom() {
        calculateItemsStackViewScrollView.layoutIfNeeded()
        
        let bottomOffset = CGPoint(
            x: 0,
            y: calculateItemsStackViewScrollView.contentSize.height
            - calculateItemsStackViewScrollView.bounds.height
            + calculateItemsStackViewScrollView.contentInset.bottom
        )
        
        calculateItemsStackViewScrollView.setContentOffset(bottomOffset, animated: true)
    }
}


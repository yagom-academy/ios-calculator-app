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
    
    private let numberFormatter = NumberFormatter()
    private var operatorsAndOperandsInput: String = ""
    
    // MARK: - View State Method

    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 15
        numberFormatter.roundingMode = .halfDown
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
            operandLabel.text = formatNumber(of: try calculate())
        } catch let error as CalculatorError {
            switch error {
            case .divisionError:
                print(error.message)
                operandLabel.text = "NaN"
            }
        } catch {
            print("알 수 없는 에러 발생")
        }
    }

    // MARK: - Method
    
    private func formatNumber(of number: Any?) -> String? {
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
        guard
            let operandLabelText = removeComma(of: operandLabel.text),
            let formattedNumber = formatNumber(of: Decimal(string: operandLabelText))
        else {
            return
        }
        
        let operatorLabel = createUILabel(text: self.operatorLabel.text)
        let operandLabel = createUILabel(text: formattedNumber)
        
        if operandLabel.text?.last == "." {
            operandLabel.text?.removeLast()
        }
        
        let calculateItemStackView = createCalculateItemStackView(operatorLabel, operandLabel)
        
        calculateItemsStackView.addArrangedSubview(calculateItemStackView)
        
        operatorsAndOperandsInput.append(operatorLabel.text ?? "")
        operatorsAndOperandsInput.append(operandLabel.text ?? "")
        
        scrollToBottom()
    }
    
    private func removeComma(of text: String?) -> String? {
        return text?.components(separatedBy: ",").joined()
    }
    
    private func createUILabel(text: String?) -> UILabel {
        let label = UILabel()
        label.textColor = .white
        label.text = text
        
        return label
    }
    
    private func createCalculateItemStackView(_ labels: UILabel...) -> UIStackView {
        let stackView = UIStackView()
        stackView.spacing = 8.0
        
        labels.forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }
    
    private func calculate() throws -> Double {
        var formula = ExpressionParser.parse(from: operatorsAndOperandsInput)
        
        clearOperator()
        operatorsAndOperandsInput = ""
        
        return try formula.result()
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


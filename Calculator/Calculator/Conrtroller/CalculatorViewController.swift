//
//  Calculator - ViewController.swift
//  Created by 써니쿠키.
//  Copyright © 써니쿠키. All rights reserved.
// 

import UIKit

final class CalculatorViewController: UIViewController {
    private enum Text {
        static let zero: String = "0"
        static let noValue: String = ""
        static let negativeSymbol: String = "-"
        static let dot: Character = "."
    }
    
    @IBOutlet private weak var inputOperandLabel: UILabel!
    @IBOutlet private weak var inputOperatorLabel: UILabel!
    @IBOutlet private weak var showingOperationsStackView: UIStackView!
    @IBOutlet private weak var scrollView: UIScrollView!
    
    private let numberFormatter = NumberFormatter()
    private var rawFormulas: [String] = []
    private var result: Double = 0.0
    private var isCalculated: Bool = false
    private var userInput: String = "" {
        willSet {
            guard newValue != Text.noValue,
                  newValue != Text.negativeSymbol else {
                inputOperandLabel.text = Text.zero
                return
            }
            
            inputOperandLabel.text = newValue
        }
    }
    
    private var operationStackView: UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 8
        
        return stackView
    }
    
    private var operatorLabel: UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = inputOperatorLabel.text
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        
        return label
    }
    
    private var operandLabel: UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = inputOperandLabel.text
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        label.setContentCompressionResistancePriority(.defaultHigh , for: .horizontal)
        
        return label
    }
    
    @IBAction private func touchUpNumberButton(_ sender: UIButton) {
        guard let number = sender.titleLabel?.text else { return }
        
        switch number {
        case "0", "00":
            guard userInput != Text.zero else { return }
        default:
            if userInput == Text.zero {
                userInput.removeFirst()
            }
        }
        
        userInput += number
    }
    
    @IBAction private func touchUpOperatorButton(_ sender: UIButton) {
        if isCalculated {
            addStackView()
            addFormula()
            resetInputNumber()
            isCalculated = false
        }
        
        guard userInput != Text.noValue else {
            inputOperatorLabel.text = sender.titleLabel?.text
            return
        }
        
        guard userInput.split(with: Text.dot).count <= 2,
              userInput != String(Text.dot) else {
            resetInputNumber()
            inputOperandLabel.text = numberFormatter.notANumberSymbol
            return
        }
        
        addFormula()
        addStackView()
        scrollTobottom()
        resetInputNumber()
        inputOperatorLabel.text = sender.titleLabel?.text
    }
    
    @IBAction private func touchUpConvertingPositiveNegativeButton() {
        guard userInput != Text.zero else { return }
        
        if userInput.prefix(1) == Text.negativeSymbol {
            userInput.removeFirst()
        } else {
            userInput.insert(contentsOf: Text.negativeSymbol, at: userInput.startIndex)
        }
    }
    
    @IBAction private func touchUpCEButton(_ sender: UIButton) {
        resetInputNumber()
    }
    
    @IBAction private func touchUpACButton(_ sender: UIButton) {
        showingOperationsStackView.removeSubViewAll()
        isCalculated = false
        resetRawFormula()
        resetInputNumber()
        resetOperatorLabel()
    }
    
    @IBAction private func touchUpResultButton(_ sender: UIButton) {
        guard !isCalculated else { return }
        
        addFormula()
        addStackView()
        scrollTobottom()
        resetInputNumber()
        resetOperatorLabel()
        
        do {
            var formulaQueue = ExpressionParser.parse(from: rawFormulas.joined(separator: " "))
            result = try formulaQueue.result()
            inputOperandLabel.text = String(result.changeToDemical)
            resetRawFormula()
        } catch CalculatorError.divideByZeroError {
            inputOperandLabel.text = numberFormatter.notANumberSymbol
        } catch {
            inputOperandLabel.text = "Error: Please retry"
        }
        
        isCalculated = true
    }
}

private extension CalculatorViewController {
    private func resetInputNumber() {
        userInput = Text.noValue
    }
    
    private func resetOperatorLabel() {
        inputOperatorLabel.text = Text.noValue
    }
    
    private func resetRawFormula() {
        rawFormulas = []
    }
    
    private func addFormula() {
        guard let`operator` = inputOperatorLabel.text,
              let operand = inputOperandLabel.text else {
            return
        }
        
        rawFormulas.append(`operator`)
        rawFormulas.append(operand)
    }
    
    private func addStackView() {
        let stackView = operationStackView

        stackView.addArrangedSubview(operatorLabel)
        stackView.addArrangedSubview(operandLabel)
        
        showingOperationsStackView.insertArrangedSubview(stackView,
                                                         at: showingOperationsStackView.arrangedSubviews.count)
    }
    
    private func scrollTobottom() {
        scrollView.layoutIfNeeded()
        scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.height),
                                    animated: false)
    }
}

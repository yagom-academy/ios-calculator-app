//
//  Calculator - ViewController.swift
//  Created by 써니쿠키.
//  Copyright © 써니쿠키. All rights reserved.
// 

import UIKit

final class CalculatorViewController: UIViewController {
    private enum NameSpace {
        static let zero: String = "0"
        static let doubleZero: String = "00"
        static let noValue: String = ""
        static let negativeSymbol: String = "-"
        static let dot: String = "."
        static let spacing: CGFloat = 8
        static let errorMessage: String = "Error: Please retry"
    }
    
    @IBOutlet private weak var inputOperandLabel: UILabel!
    @IBOutlet private weak var inputOperatorLabel: UILabel!
    @IBOutlet private weak var showingOperationsStackView: UIStackView!
    @IBOutlet private weak var scrollView: UIScrollView!
    
    private var rawFormulas: [String] = []
    private var result: Double = Double.zero
    private var isCalculated: Bool = false
    private var userInput: String = "" {
        willSet {
            changeOperandLabelByUserInput(newValue)
        }
    }
    
    private var operationStackView: UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = NameSpace.spacing
        
        return stackView
    }
    
    private var operatorLabel: UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = inputOperatorLabel.text
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .title3)
        
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
        case NameSpace.zero:
            guard userInput != NameSpace.zero else { return }
        case NameSpace.doubleZero:
            guard userInput != NameSpace.zero else { return }
        case NameSpace.dot:
            guard !userInput.contains(NameSpace.dot) else { return }
        default:
            if userInput == NameSpace.zero {
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
        
        guard userInput != NameSpace.noValue else {
            inputOperatorLabel.text = sender.titleLabel?.text
            return
        }
        
        addFormula()
        addStackView()
        scrollTobottom()
        resetInputNumber()
        inputOperatorLabel.text = sender.titleLabel?.text
    }
    
    @IBAction private func touchUpConvertingPositiveNegativeButton() {
        guard userInput != NameSpace.zero else { return }
        
        if userInput.contains(NameSpace.negativeSymbol) {
            userInput.removeFirst()
        } else {
            userInput.insert(contentsOf: NameSpace.negativeSymbol, at: userInput.startIndex)
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
            inputOperandLabel.text = Double.numberFormatter.notANumberSymbol
        } catch {
            inputOperandLabel.text = NameSpace.errorMessage
        }
        
        isCalculated = true
    }
}

private extension CalculatorViewController {
    func resetInputNumber() {
        userInput = NameSpace.noValue
    }
    
    func resetOperatorLabel() {
        inputOperatorLabel.text = NameSpace.noValue
    }
    
    func resetRawFormula() {
        rawFormulas = []
    }
    
    func changeOperandLabelByUserInput(_ value: String) {
        guard value != NameSpace.noValue,
              value != NameSpace.negativeSymbol else {
            inputOperandLabel.text = NameSpace.zero
            return
        }
        
        inputOperandLabel.text = value
    }
    
    func addFormula() {
        guard let`operator` = inputOperatorLabel.text,
              let operand = inputOperandLabel.text else {
            return
        }
        
        rawFormulas.append(`operator`)
        rawFormulas.append(operand)
    }
    
    func addStackView() {
        let stackView = operationStackView
        
        stackView.addArrangedSubview(operatorLabel)
        stackView.addArrangedSubview(operandLabel)
        
        showingOperationsStackView.insertArrangedSubview(
            stackView,
            at: showingOperationsStackView.arrangedSubviews.count
        )
    }
    
    func scrollTobottom() {
        scrollView.layoutIfNeeded()
        scrollView.setContentOffset(
            CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.height),
            animated: false
        )
    }
}

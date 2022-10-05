//
//  Calculator - ViewController.swift
//  Created by 써니쿠키.
//  Copyright © 써니쿠키. All rights reserved.
// 

import UIKit


class CalculatorViewController: UIViewController {
    enum Text {
        static let zero: String = "0"
        static let noValue: String = ""
        static let negativeSymbol: String = "-"
        static let dot: Character = "."
    }
    
    @IBOutlet private weak var operandLabel: UILabel!
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var showingOperationsStackView: UIStackView!
    @IBOutlet private weak var scrollView: UIScrollView!
    
    private let numberFormatter = NumberFormatter()
    private var rawFormula: [String] = []
    private var result: Double = 0.0
    private var isCalculated: Bool = false
    private var inputNumber: String = "" {
        willSet {
            guard newValue != Text.noValue,
                  newValue != Text.negativeSymbol else {
                operandLabel.text = Text.zero
                return
            }
            
            operandLabel.text = newValue
        }
    }
    
    private var makeStackView: UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 8
        
        return stackView
    }
    
    private var makeOperatorLabel: UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = operatorLabel.text
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        
        return label
    }
    
    private var makeOperandLabel: UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = operandLabel.text
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
            guard inputNumber != Text.zero else { return }
        default:
            if inputNumber == Text.zero {
                inputNumber.removeFirst()
            }
        }
        
        inputNumber += number
    }
    
    @IBAction private func touchUpOperatorButton(_ sender: UIButton) {
        if isCalculated {
            addStackView()
            addFormula()
            resetInputNumber()
            isCalculated = false
        }
        
        guard inputNumber != Text.noValue else {
            operatorLabel.text = sender.titleLabel?.text
            return
        }
        
        guard inputNumber.split(with: Text.dot).count <= 2,
              inputNumber != String(Text.dot) else {
            resetInputNumber()
            operandLabel.text = numberFormatter.notANumberSymbol
            return
        }
        
        addFormula()
        addStackView()
        scrollTobottom()
        resetInputNumber()
        operatorLabel.text = sender.titleLabel?.text
    }
    
    @IBAction private func touchUpConvertingPositiveNegativeButton() {
        guard inputNumber != Text.zero else { return }
        
        if inputNumber.prefix(1) == Text.negativeSymbol {
            inputNumber.removeFirst()
        } else {
            inputNumber.insert(contentsOf: Text.negativeSymbol, at: inputNumber.startIndex)
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
            var formulaQueue = ExpressionParser.parse(from: rawFormula.joined(separator: " "))
            result = try formulaQueue.result()
            operandLabel.text = String(result.changeToDemical)
            resetRawFormula()
        } catch CalculatorError.divideByZeroError {
            operandLabel.text = numberFormatter.notANumberSymbol
        } catch {
            operandLabel.text = "Error: Please retry"
        }
        
        isCalculated = true
    }
}

private extension CalculatorViewController {
    private func resetInputNumber() {
        inputNumber = Text.noValue
    }
    
    private func resetOperatorLabel() {
        operatorLabel.text = Text.noValue
    }
    
    private func resetRawFormula() {
        rawFormula = []
    }
    
    private func addFormula() {
        guard let`operator` = operatorLabel.text,
              let operand = operandLabel.text else {
            return
        }
        
        rawFormula.append(`operator`)
        rawFormula.append(operand)
    }
    
    private func addStackView() {
        let stackView = makeStackView

        stackView.addArrangedSubview(makeOperatorLabel)
        stackView.addArrangedSubview(makeOperandLabel)
        
        showingOperationsStackView.insertArrangedSubview(stackView,
                                                         at: showingOperationsStackView.arrangedSubviews.count)
    }
    
    private func scrollTobottom() {
        scrollView.layoutIfNeeded()
        scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.height),
                                    animated: false)
    }
}

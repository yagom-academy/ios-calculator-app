//
//  Calculator - ViewController.swift
//  Created by 써니쿠키.
//  Copyright © 써니쿠키. All rights reserved.
// 

import UIKit

struct Text {
    fileprivate static let zero: String = "0"
    fileprivate static let noValue: String = ""
    fileprivate static let blank: String = " "
    fileprivate static let negativeSymbol: String = "-"
    fileprivate static let dot: Character = "."
}

class ViewController: UIViewController {
    @IBOutlet private weak var operandLabel: UILabel!
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var showingOperationsStackView: UIStackView!
    @IBOutlet private weak var scrollView: UIScrollView!
    
    private let numberFormatter = NumberFormatter()
    private var rawFormula: String = ""
    private var result: Double = 0.0
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
        MakeOperationStackView()
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
        resetOperatorLabel()
    }
    
    @IBAction private func touchUpACButton(_ sender: UIButton) {
        showingOperationsStackView.removeSubViewAll()
        resetRawFormula()
        resetInputNumber()
        resetOperatorLabel()
    }
    
    @IBAction private func touchUpResultButton(_ sender: UIButton) {
        guard operandLabel.text != result.changeToDemical else { return }

        addFormula()
        MakeOperationStackView()
        scrollTobottom()
        resetInputNumber()
        resetOperatorLabel()
       
        do {
            var formulaQueue = ExpressionParser.parse(from: rawFormula)
            result = try formulaQueue.result()
            operandLabel.text = String(result.changeToDemical)
        } catch CalculatorError.divideByZeroError {
            operandLabel.text = numberFormatter.notANumberSymbol
        } catch {
            operandLabel.text = "Error: Please retry"
        }
    }
    
    private func addFormula() {
        guard let`operator` = operatorLabel.text,
              let operand = operandLabel.text else {
            return
        }
        
        if `operator` == Text.blank {
            rawFormula += (String(Operator.add.rawValue) + operand)
        } else {
            rawFormula += (`operator` + operand)
        }
    }
    
    private func MakeOperationStackView() {
        let operationStackView = UIStackView()
        operationStackView.axis = .horizontal
        operationStackView.translatesAutoresizingMaskIntoConstraints = false
        operationStackView.distribution = .fill
        operationStackView.alignment = .fill
        operationStackView.spacing = 8
        
        operationStackView.addArrangedSubview(makeOperatorLabel())
        operationStackView.addArrangedSubview(makeOperandLabel())
        
        showingOperationsStackView.insertArrangedSubview(operationStackView,
                                                         at: showingOperationsStackView.arrangedSubviews.count)
    }
    
    private func makeOperatorLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = operatorLabel.text
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        
        return label
    }
    
    private func makeOperandLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = operandLabel.text
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        label.setContentCompressionResistancePriority(.defaultHigh , for: .horizontal)
        
        return label
    }
    
    private func scrollTobottom() {
        scrollView.layoutIfNeeded()
        scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.height),
                                    animated: false)
    }
}

extension ViewController {
    private func resetInputNumber() {
        inputNumber = Text.noValue
    }
    
    private func resetOperatorLabel() {
        operatorLabel.text = Text.blank
    }
    
    private func resetRawFormula() {
        rawFormula = Text.noValue
    }
}

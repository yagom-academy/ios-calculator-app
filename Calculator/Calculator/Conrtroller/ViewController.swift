//
//  Calculator - ViewController.swift
//  Created by 써니쿠키.
//  Copyright © 써니쿠키. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var showingOperationsStackView: UIStackView!    
    @IBOutlet weak var scrollView: UIScrollView!
    
    private let numberFormatter = NumberFormatter()
    private let zero = "0"
    private let noValue = ""
    private let blank = " "
    private var formula: String = ""
    private var result: Double = 0.0
    private var inputNumber: String = "" {
        willSet {
            guard newValue != noValue else {
                operandLabel.text = zero
                return
            }
            
            operandLabel.text = newValue
        }
    }
    
    @IBAction func touchUpNumberButton(_ sender: UIButton) {
        guard let number = sender.titleLabel?.text else { return }
        
        switch number {
        case "0", "00":
            guard inputNumber != zero else { return }
        default:
            if inputNumber == zero {
                inputNumber.removeFirst()
            }
        }
        
        inputNumber += number
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        guard inputNumber != noValue else {
            operatorLabel.text = sender.titleLabel?.text
            return
        }
        
        addFormula()
        MakeOperationStackView()
        scrollTobottom()
        inputNumber = noValue
        operatorLabel.text = sender.titleLabel?.text
    }
    
    @IBAction func touchUpConvertingPositiveNegativeButton() {
        if inputNumber.prefix(1) == "-" {
            inputNumber.removeFirst()
        } else {
            inputNumber.insert("-", at: inputNumber.startIndex)
        }
    }
    
    @IBAction func touchUpCEButton(_ sender: UIButton) {
        inputNumber = noValue
    }
    
    @IBAction func touchUpACButton(_ sender: UIButton) {
        showingOperationsStackView.subviews.forEach { $0.removeFromSuperview() }
        formula = noValue
        inputNumber = noValue
        operatorLabel.text = blank
    }
    
    @IBAction func touchUpResultButton(_ sender: UIButton) {
        guard operandLabel.text != String(result) else { return }
        
        addFormula()
        MakeOperationStackView()
        inputNumber = noValue
        
        do {
            var formulaQueue = ExpressionParser.parse(from: formula)
            result = try formulaQueue.result()
            operandLabel.text = String(changeStyle(result))
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
        
        if `operator` == blank {
            formula += ("+" + operand)
        } else {
            formula += (`operator` + operand)
        }
    }
    
    private func MakeOperationStackView() {
        let operationStackView = UIStackView()
        operationStackView.axis = .horizontal
        operationStackView.translatesAutoresizingMaskIntoConstraints = false
        operationStackView.distribution = .fill
        operationStackView.alignment = .fill
        operationStackView.spacing = 8
        
        let operatorLabel = makeOperatorLabel()
        
        operationStackView.addArrangedSubview(operatorLabel)
        operationStackView.addArrangedSubview(makeOperandLabel())
        
        showingOperationsStackView.insertArrangedSubview(operationStackView,
                                                         at: showingOperationsStackView.arrangedSubviews.count)
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
    
    private func makeOperatorLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = operatorLabel.text
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        
        return label
    }
    
    private func scrollTobottom() {
        scrollView.layoutIfNeeded()
        scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.height),
                                    animated: false)
    }
    
    private func changeStyle(_ operationResult: Double) -> String {
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 20
        numberFormatter.roundingMode = .up
        
        let result = numberFormatter.string(from: operationResult as NSNumber) ?? zero
        
        return result
    }
}

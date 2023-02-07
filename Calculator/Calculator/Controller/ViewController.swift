//
//  Calculator - ViewController.swift
//  Created by 혜모리, 릴라.
//  Copyright © yagom. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private weak var operandLabel: UILabel!
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var operationContentStackView: UIStackView!
    @IBOutlet private weak var operationScrollView: UIScrollView!
    
    private enum Sign {
        static let dot: Character = "."
        static let blank = " "
        static let empty = ""
        static let zero = "0"
        static let zeroZero = "00"
        static let negative: Character = "-"
        static let nan = "NaN"
    }
    
    private var expression: String = Sign.empty
    private var isCalculatedStatus: Bool = false
    private var currentOperator: String { operatorLabel.text ?? Sign.zero }
    private var currentOperand: String { operandLabel.text ?? Sign.empty }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetCalculator()
    }
    
    private func resetCalculator() {
        operandLabel.text = Sign.zero
        operatorLabel.text = Sign.blank
        expression.removeAll()
        operationContentStackView.subviews.forEach { $0.removeFromSuperview() }
    }
    
    @IBAction private func didTapNumberButton(_ sender: UIButton) {
        updateOperand(with: sender.titleLabel?.text)
    }

    @IBAction private func didTapDot(_ sender: UIButton) {
        updateDot()
    }
    
    @IBAction private func didTapOperatorButton(_ sender: UIButton) {
        updateOperator(with: sender.titleLabel?.text)
    }
    
    @IBAction private func didTapACButton(_ sender: UIButton) {
        resetCalculator()
    }
    
    @IBAction private func didTapCEButton(_ sender: UIButton) {
        operandLabel.text = Sign.zero
    }
    
    @IBAction private func didTapConvertPositiveAndNegativeNumber(_ sender: UIButton) {
        let operandValue = convertPositiveAndNegativeNumber()
        
        operandLabel.text = operandValue.applyFormatter()
    }
    
    @IBAction private func didTapEqualButton(_ sender: UIButton) {
        guard operatorLabel.text != Sign.blank else { return }
        
        setOperationContentStackView(operatorValue: currentOperator, operandValue: currentOperand)
        isCalculatedStatus = true
        displayOperationResult()
    }
    
    private func displayOperationResult() {
        let input = expression + " \(currentOperator) " + currentOperand.removeComma()
        let result = ExpressionParser.parse(from: input).result()
        
        guard result.isNaN == false else {
            operatorLabel.text = Sign.blank
            operandLabel.text = Sign.nan
            expression.removeAll()
            return
        }
        
        operatorLabel.text = Sign.blank
        operandLabel.text = String(result).applyFormatter()
        expression.removeAll()
    }
    
    private func updateOperand(with number: String?) {
        guard let inputNumber = number else { return }
        guard currentOperand.removeDotAndNegative().count < 20 else { return }
        
        guard isCalculatedStatus != true else {
            isCalculatedStatus = false
            operandLabel.text = inputNumber.applyFormatter()
            return
        }
        
        if currentOperand == Sign.zero {
            guard currentOperand != Sign.zeroZero else { return }
            
            operandLabel.text = inputNumber.applyFormatter()
        } else {
            guard currentOperand.contains(Sign.dot) == false else {
                operandLabel.text = currentOperand + inputNumber
                return
            }
            
            operandLabel.text = (currentOperand + inputNumber).applyFormatter()
        }
    }
    
    private func updateDot() {
        guard currentOperand.contains(Sign.dot) == false else { return }
        
        operandLabel.text = currentOperand.applyFormatter() + String(Sign.dot)
    }
    
    private func updateOperator(with sign: String?) {
        guard let operatorValue = sign else { return }
        
        guard expression != Sign.empty else {
            expression += currentOperand.removeComma()
            setOperationContentStackView(operatorValue: Sign.empty,
                                         operandValue: currentOperand.applyFormatter())
            isCalculatedStatus = false
            operatorLabel.text = operatorValue
            operandLabel.text = Sign.zero
            return
        }
        
        if operandLabel.text == Sign.zero {
            expression += " \(currentOperator) "
            expression = String(expression.dropLast(3))
        } else {
            setOperationContentStackView(operatorValue: currentOperator,
                                  operandValue: currentOperand.applyFormatter())
            expression += " \(currentOperator) " + currentOperand.removeComma()
        }
        
        isCalculatedStatus = false
        operatorLabel.text = operatorValue
        operandLabel.text = Sign.zero
    }
    
    private func convertPositiveAndNegativeNumber() -> String {
        guard var operands = operandLabel.text,
              operands != Sign.zero  else { return Sign.zero }
        
        if operands.first == Sign.negative {
            operands.removeFirst()
        } else {
            operands = "\(Sign.negative)" + operands
        }
        return operands
    }
    
    private func createLabel(input: String) -> UILabel {
        let label = UILabel()
        
        label.text = input
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .title3)
        return label
    }
    
    private func createOperationStackView(operatorLabel: UILabel,
                                          operandLabel: UILabel) -> UIStackView {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.addArrangedSubview(operatorLabel)
        stackView.addArrangedSubview(operandLabel)
        return stackView
    }
    
    private func setScrollView() {
        operationScrollView.layoutIfNeeded()
        operationScrollView.setContentOffset(CGPoint(x: 0,
                                                     y: operationScrollView.contentSize.height
                                                     - operationScrollView.bounds.height),
                                             animated: true)
    }
    
    private func setOperationContentStackView(operatorValue: String, operandValue: String) {
        let operatorLabel = createLabel(input: operatorValue)
        let operandLabel = createLabel(input: operandValue)
        let operationStackView = createOperationStackView(operatorLabel: operatorLabel,
                                                          operandLabel: operandLabel)
        operationContentStackView.addArrangedSubview(operationStackView)
        setScrollView()
    }
}

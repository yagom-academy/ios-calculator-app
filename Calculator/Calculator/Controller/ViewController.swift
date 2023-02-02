//
//  Calculator - ViewController.swift
//  Created by 혜모리.
//  Copyright © yagom. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var operationContentStackView: UIStackView!
    @IBOutlet weak var operationScrollView: UIScrollView!
    
    enum Sign {
        static let dot: Character = "."
        static let blank = " "
        static let empty = ""
        static let zero = "0"
        static let zeroZero = "00"
        static let negative = "-"
        static let nan = "NaN"
    }
    
    var expression: String = Sign.empty
    var isCalculatedStatus: Bool = false
    var currentOperator: String { (operatorLabel.text ?? Sign.zero) }
    var currentOperand: String { (operandLabel.text ?? Sign.empty) }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetCalculator()
    }
    
    func resetCalculator() {
        operandLabel.text = Sign.zero
        operatorLabel.text = Sign.blank
        expression.removeAll()
        operationContentStackView.subviews.forEach { $0.removeFromSuperview() }
    }
    
    @IBAction func didTapNumberButton(_ sender: UIButton) {
        updateOperand(with: sender.titleLabel?.text)
    }

    @IBAction func didTapDot(_ sender: UIButton) {
        updateDot()
    }
    
    @IBAction func didTapOperatorButton(_ sender: UIButton) {
        updateOperator(with: sender.titleLabel?.text)
    }
    
    @IBAction func didTapACButton(_ sender: UIButton) {
        resetCalculator()
    }
    
    @IBAction func didTapCEButton(_ sender: UIButton) {
        operandLabel.text = Sign.zero
    }
    
    @IBAction func didTapConvertPositiveAndNegativeNumber(_ sender: UIButton) {
        let operandValue = convertPositiveAndNegativeNumber()
        operandLabel.text = operandValue.applyFormatter()
    }
    
    @IBAction func didTapEqualButton(_ sender: UIButton) {
        guard operatorLabel.text != Sign.blank else { return }
        
        setOperationStackView(operatorValue: currentOperator, operandValue: currentOperand)
        isCalculatedStatus = true
        displayOperationResult()
    }
    
    func displayOperationResult() {
        let input = expression + " \(currentOperator) " + currentOperand.split(with: ",").joined()
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
    
    func updateOperand(with number: String?) {
        guard let inputNumber = number else { return }
        
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
    
    func updateDot() {
        guard currentOperand.contains(Sign.dot) == false
        else { return }
        
        operandLabel.text = currentOperand.applyFormatter() + String(Sign.dot)
    }
    
    func updateOperator(with sign: String?) {
        guard let operatorValue = sign else { return }
        
        if expression == Sign.empty {
            expression += currentOperand.split(with: ",").joined()
            setOperationStackView(operatorValue: Sign.empty,
                                  operandValue: currentOperand.applyFormatter())
        } else if operandLabel.text == Sign.zero {
            expression += " \(currentOperator) "
            expression = String(expression.dropLast(3))
        } else {
            setOperationStackView(operatorValue: currentOperator,
                                  operandValue: currentOperand.applyFormatter())
            expression += " \(currentOperator) " + currentOperand.split(with: ",").joined()
        }
        
        isCalculatedStatus = false
        operatorLabel.text = operatorValue
        operandLabel.text = Sign.zero
    }
    
    func convertPositiveAndNegativeNumber() -> String {
        guard currentOperand != Sign.zero else { return Sign.zero }
        
        let operandValue = currentOperand
        
        guard operandValue.prefix(1) != Sign.negative
        else { return String(operandValue.dropFirst(1)) }
        
        return Sign.negative + operandValue
    }
    
    func createLabel(input: String) -> UILabel {
        let label = UILabel()
        
        label.text = input
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .title3)
        return label
    }
    
    func createOperationStackView(operatorLabel: UILabel, operandLabel: UILabel) -> UIStackView {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.addArrangedSubview(operatorLabel)
        stackView.addArrangedSubview(operandLabel)
        return stackView
    }
    
    func setScrollView() {
        operationScrollView.layoutIfNeeded()
        operationScrollView.setContentOffset(CGPoint(x: 0,
                                                     y: operationScrollView.contentSize.height
                                                     - operationScrollView.bounds.height),
                                             animated: true)
    }
    
    func setOperationStackView(operatorValue: String, operandValue: String) {
        let operatorLabel = createLabel(input: operatorValue)
        let operandLabel = createLabel(input: operandValue)
        let operationStackView = createOperationStackView(operatorLabel: operatorLabel,
                                                          operandLabel: operandLabel)
        operationContentStackView.addArrangedSubview(operationStackView)
        setScrollView()
    }
}

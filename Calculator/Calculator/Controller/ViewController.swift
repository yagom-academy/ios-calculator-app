//
//  Calculator - ViewController.swift
//  Created by 혜모리.
//  Copyright © yagom. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
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
    
    var parsingValue: String = Sign.empty
    var isCalculatedStatus: Bool = false
    var currentOperator: String { operatorLabel.text ?? Sign.zero }
    var currentOperand: String { operandLabel.text ?? Sign.empty }
    
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetCalculator()
    }
    
    func updateOperand(with number: String?) {
        guard let inputNumber = number else { return }
        guard isCalculatedStatus != true else {
            isCalculatedStatus = false
            return operandLabel.text = inputNumber.addComma()
        }
        
        if operandLabel.text == Sign.zero {
            guard inputNumber != Sign.zeroZero else { return }
            operandLabel.text = inputNumber.addComma()
        } else {
            operandLabel.text = currentOperand + inputNumber.addComma()
        }
    }
    
    func updateDot() {
        guard currentOperand != Sign.zero,
        currentOperand.contains(Sign.dot) == false
        else { return }
        
        operandLabel.text = currentOperand + String(Sign.dot)
    }
    
    func updateOperator(with sign: String?) {
        guard let operatorValue = sign else { return }
        
        isCalculatedStatus = false
        
        if parsingValue == Sign.empty {
            operatorLabel.text = operatorValue
            parsingValue += currentOperand
            setOperationStackView(operatorValue: Sign.empty, operandValue: currentOperand.addComma())
            operandLabel.text = Sign.zero
        } else if operandLabel.text == Sign.zero {
            parsingValue += " \(currentOperator) "
            parsingValue = String(parsingValue.dropLast(3))
            operatorLabel.text = operatorValue
            operandLabel.text = Sign.zero
        } else {
            setOperationStackView(operatorValue: currentOperator, operandValue: currentOperand.addComma())
            parsingValue += " \(currentOperator) " + currentOperand
            operatorLabel.text = operatorValue
            
            operandLabel.text = Sign.zero
        }
    }
    
    func resetCalculator() {
        operandLabel.text = Sign.zero
        operatorLabel.text = Sign.blank
        parsingValue = Sign.empty
        operationContentStackView.subviews.forEach { $0.removeFromSuperview() }
    }
    
    @IBAction func didTapEquals(_ sender: UIButton) {
        setOperationStackView(operatorValue: currentOperator, operandValue: currentOperand)
        let input = parsingValue + " \(currentOperator) " + currentOperand
        let formula = ExpressionParser.parse(from: input.split(with: ",").joined()).result()
        let result = String(formula).split(with: Sign.dot)
        isCalculatedStatus = true
        
        guard formula.isNaN == false else {
            operatorLabel.text = Sign.blank
            operandLabel.text = Sign.nan
            parsingValue.removeAll()
            return
        }
        
        guard result[1] != Sign.zero else {
            operatorLabel.text = Sign.blank
            operandLabel.text = result[0].addComma()
            parsingValue.removeAll()
            return
        }
        
        operatorLabel.text = Sign.blank
        operandLabel.text = String(formula).addComma()
        parsingValue.removeAll()
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
    
    func convertPositiveAndNegativeNumber() -> String {
        guard currentOperand != Sign.zero else { return Sign.zero }
        
        let operandValue = currentOperand.split(with: ",").joined()
        
        guard operandValue.prefix(1) != Sign.negative
        else { return String(operandValue.dropFirst(1)) }
        
        return Sign.negative + operandValue
    }
    
    @IBAction func didTapConvertPositiveAndNegativeNumber(_ sender: UIButton) {
        let operandValue = convertPositiveAndNegativeNumber()
        operandLabel.text = operandValue.addComma()
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
    
    func setOperationStackView(operatorValue: String, operandValue: String) {
        let operatorLabel = createLabel(input: operatorValue)
        let operandLabel = createLabel(input: operandValue)
        let operationStackView = createOperationStackView(operatorLabel: operatorLabel, operandLabel: operandLabel)
        operationContentStackView.addArrangedSubview(operationStackView)
        setScrollView()
    }
    
    func setScrollView() {
        operationScrollView.layoutIfNeeded()
        operationScrollView.setContentOffset(CGPoint(x: 0, y: operationScrollView.contentSize.height - operationScrollView.bounds.height), animated: true)
    }
}

//
//  Calculator - ViewController.swift
//  Created by 혜모리.
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {
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
    
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var operationContentStackView: UIStackView!
    @IBOutlet weak var operationScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetCalculator()
    }
    
    func updateOperand(with number: String?) {
        guard let inputNumber = number else { return }
        guard isCalculatedStatus != true else {
            isCalculatedStatus = false
            return operandLabel.text = inputNumber
        }
        
        if operandLabel.text == Sign.zero {
            guard inputNumber != Sign.zeroZero else { return }
            operandLabel.text = inputNumber
        } else {
            operandLabel.text = (operandLabel.text ?? Sign.empty) + inputNumber
        }
    }
    
    func updateDot() {
        guard operandLabel.text != Sign.zero else { return }
        guard operandLabel.text?.contains(Sign.dot) == false else { return }
        
        operandLabel.text = (operandLabel.text ?? Sign.empty) + String(Sign.dot)
    }
    
    func updateOperator(with sign: String?) {
        guard let operatorValue = sign, let operandValue = operandLabel.text else { return }
        
        isCalculatedStatus = false
        
        if parsingValue == Sign.empty {
            operatorLabel.text = operatorValue
            parsingValue += (operandLabel.text ?? Sign.empty)
            setOperationStackView(operatorValue: Sign.empty, operandValue: operandValue)
            operandLabel.text = Sign.zero
        } else if operandLabel.text == Sign.zero {
            parsingValue += " \(operatorLabel.text ?? Sign.empty) "
            parsingValue = String(parsingValue.dropLast(3))
            operatorLabel.text = operatorValue
            operandLabel.text = Sign.zero
        } else {
            setOperationStackView(operatorValue: operatorLabel.text ?? Sign.empty, operandValue: operandValue)
            parsingValue += " \(operatorLabel.text ?? Sign.empty) " + (operandLabel.text ?? Sign.empty)
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
        guard let operatorValue = operatorLabel.text, let operandValue = operandLabel.text else { return }
        
        setOperationStackView(operatorValue: operatorValue, operandValue: operandValue)
        let input = parsingValue + " \(operandValue) " + (operandLabel.text ?? Sign.empty)
        let formula = ExpressionParser.parse(from: input).result()
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
            operandLabel.text = result[0]
            parsingValue.removeAll()
            return
        }
        
        operatorLabel.text = Sign.blank
        operandLabel.text = String(formula)
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
        guard let operandValue = operandLabel.text
        else { return Sign.zero }
        
        guard operandValue.prefix(1) != Sign.negative
        else { return String(operandValue.dropFirst(1)) }
        
        return Sign.negative + operandValue
    }
    
    @IBAction func didTapConvertPositiveAndNegativeNumber(_ sender: UIButton) {
        let operandValue = convertPositiveAndNegativeNumber()
        operandLabel.text = operandValue
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

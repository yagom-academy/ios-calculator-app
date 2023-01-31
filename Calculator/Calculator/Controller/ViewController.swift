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
    }
    
    let numberFormatter = NumberFormatter()
    var parsingValue: String = Sign.empty
    var isCalculated: Bool = false
    
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetCalculator()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = -2
        numberFormatter.string(for: operandLabel.text)
    }
    
    func updateOperand(with number: String?) {
        guard let inputNumber = number else { return }
        guard isCalculated != true else {
            isCalculated = false
            return operandLabel.text = inputNumber
        }
        
        if operandLabel.text == Sign.zero {
            guard inputNumber != Sign.zeroZero else { return }
            isCalculated = false
            operandLabel.text = inputNumber
        } else {
            isCalculated = false
            operandLabel.text = (operandLabel.text ?? Sign.empty) + inputNumber
        }
    }
    
    func updateDot() {
        guard operandLabel.text != Sign.zero else { return }
        guard operandLabel.text?.contains(Sign.dot) == false else { return }
        
        operandLabel.text = (operandLabel.text ?? Sign.empty) + String(Sign.dot)
    }
    
    func updateOperator(with sign: String?) {
        guard let operatorValue = sign else { return }
        operatorLabel.text = operatorValue
        isCalculated = false
        
        if operandLabel.text == Sign.zero {
            return
        } else {
            parsingValue = (operandLabel.text ?? Sign.zero) + " \(operatorValue) "
            operandLabel.text = Sign.zero
        }
    }
    
    func resetCalculator() {
        operandLabel.text = Sign.zero
        operatorLabel.text = Sign.blank
    }
    
    @IBAction func didTapEquals(_ sender: UIButton) {
        let input = parsingValue + (operandLabel.text ?? Sign.zero)
        let formula = ExpressionParser.parse(from: input).result()
        let result = String(formula).split(with: Sign.dot)
        isCalculated = true
        
        guard result[1] != Sign.zero else {
            parsingValue = Sign.empty
            operatorLabel.text = Sign.blank
            return operandLabel.text = result[0]
        }
        parsingValue = Sign.empty
        operatorLabel.text = Sign.blank
        operandLabel.text = String(formula)
    }
    
    @IBAction func didTapNumberZero(_ sender: UIButton) {
        updateOperand(with: sender.titleLabel?.text)
    }

    @IBAction func didTapDot(_ sender: UIButton) {
        updateDot()
    }
    
    @IBAction func didTapDivision(_ sender: UIButton) {
        updateOperator(with: sender.titleLabel?.text)
    }
    
    @IBAction func didTapACButton(_ sender: UIButton) {
        resetCalculator()
    }
}

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
        static let nan = "NaN"
    }
    @IBOutlet weak var parsingV: UILabel!
    
    let numberFormatter = NumberFormatter()
    var parsingValue: String = Sign.empty
    var isCalculatedStatus: Bool = false
    
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
        guard let operatorValue = sign else { return }
        
        operatorLabel.text = operatorValue
        isCalculatedStatus = false
        
        if operandLabel.text == Sign.zero {
            parsingValue = String(parsingValue.dropLast(3))
//            parsingValue += " \(operatorValue) "
            operandLabel.text = Sign.zero
            parsingV.text = parsingValue
            return
        } else {
            parsingValue += (operandLabel.text ?? Sign.empty) + " \(operatorValue) "
            operandLabel.text = Sign.zero
            parsingV.text = parsingValue
        }
    }
    
    func resetCalculator() {
        operandLabel.text = Sign.zero
        operatorLabel.text = Sign.blank
        parsingValue = Sign.empty
    }
    
    @IBAction func didTapEquals(_ sender: UIButton) {
        let input = parsingValue + (operandLabel.text ?? Sign.empty)
        let formula = ExpressionParser.parse(from: input).result()
        let result = String(formula).split(with: Sign.dot)
        isCalculatedStatus = true
        
        guard formula.isNaN == false else {
            operatorLabel.text = Sign.blank
            operandLabel.text = Sign.nan
            parsingValue.removeAll()
            return parsingV.text = parsingValue
        }
        
        guard result[1] != Sign.zero else {
            operatorLabel.text = Sign.blank
            operandLabel.text = result[0]
            parsingValue.removeAll()
            return parsingV.text = parsingValue
        }
        
        operatorLabel.text = Sign.blank
        operandLabel.text = String(formula)
        parsingValue.removeAll()
        parsingV.text = parsingValue
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
        operandLabel.text = "-" + (operandLabel.text ?? Sign.empty)
    }
}

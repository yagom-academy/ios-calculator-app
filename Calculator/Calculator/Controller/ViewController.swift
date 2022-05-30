//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {
    // MARK: - Properties
    
    @IBOutlet weak var inputNumberLabel: UILabel!
    @IBOutlet weak var inputOperatorLabel: UILabel!
    @IBOutlet weak var divisionButton: UIButton!
    @IBOutlet weak var multiplicationButton: UIButton!
    @IBOutlet weak var subtractionButton: UIButton!
    @IBOutlet weak var additionButton: UIButton!
    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    
    private var inputNumber = ""
    private var inputOperator = ""
    private var arithmetic = ""
    private var isPositiveNumber = true
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetCalculator()
    }
}

// MARK: - UI

extension ViewController {
    @IBAction private func tapAllClearButton(_ sender: UIButton) {
        resetCalculator()
    }
    
    @IBAction private func tapClearEntryButton(_ sender: UIButton) {
        inputNumber = ""
        inputNumberLabel.text = "0"
    }
    
    private func resetCalculator() {
        stackView.removeAllArrangedSubview()
        inputNumberLabel.text = "0"
        inputOperatorLabel.text = ""
        arithmetic = ""
        inputNumber = ""
        isPositiveNumber = true
        inputOperator = ""
    }
    
    private func updateStackView() {
        if inputNumber == "" {
            return
        }
        
        if inputNumber.last == "." {
            inputNumber.removeLast()
        }
        
        stackView.addLable(operator: inputOperator, operand: inputNumber)
        arithmetic = arithmetic + inputOperator + inputNumber
        inputNumber = ""
        inputOperator = ""
        inputNumberLabel.text = "0"
    }
}

// MARK: - Action

extension ViewController {
    @IBAction private func tapKeypadButton(_ sender: UIButton) {
        let tappedNumber = sender.titleLabel?.text ?? "0"
        updateInputNumber(with: tappedNumber)
        inputNumberLabel.text = inputNumber
    }
    
    @IBAction private func tapOperatorsButton(_ sender: UIButton) {
        var currentOperator: Character = " "
        switch sender {
        case additionButton:
            currentOperator = Operator.add.symbol
        case subtractionButton:
            currentOperator = Operator.subtract.symbol
        case multiplicationButton:
            currentOperator = Operator.multiply.symbol
        case divisionButton:
            currentOperator = Operator.divide.symbol
        default:
            return
        }
        
        updateStackView()
        
        inputOperatorLabel.text = String(currentOperator)
        inputOperator = String(currentOperator)
    }
    
    @IBAction private func tapResultButton() {
        if arithmetic.isEmpty {
            return
        }
        
        updateStackView()
        
        let formula = ExpressionParser.parse(from: arithmetic)
        var result = 0.0
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 20
        
        do {
            result = try formula.result()
            inputNumber = numberFormatter.string(from: NSNumber(value: result)) ?? "0"
            inputNumberLabel.text = inputNumber
        } catch CalculatorError.dividedByZero {
            inputNumberLabel.text = CalculatorError.dividedByZero.errorMessage
        } catch {
            inputNumberLabel.text = CalculatorError.unknownError.errorMessage
        }
        
        inputOperatorLabel.text = ""
        inputNumber = ""
        arithmetic = ""
    }
    
    @IBAction private func tapToChangeSignButton(_ sender: UIButton) {
        if inputNumber == "0" || inputNumber == "" {
            return
        }
        
        if isPositiveNumber {
            inputNumber = "-" + inputNumber
            isPositiveNumber = false
        } else {
            inputNumber = inputNumber.replacingOccurrences(of: "-", with: "")
            isPositiveNumber = true
        }
        
        inputNumberLabel.text = inputNumber
    }
    
    private func updateInputNumber(with number: String) {
        if inputNumber.contains(".") && number == "." {
            return
        }
        
        if (inputNumber == "" || inputNumber == "0") && (number == "0" || number == "00") {
            inputNumber = "0"
        } else if inputNumber == "" && number == "." {
            inputNumber = "0."
        } else if inputNumber == "0" && number != "."{
            inputNumber = number
        } else {
            inputNumber += number
        }
    }
}

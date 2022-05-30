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
    
    // TODO : calculatorValue로 바꾸기
    var calculatorValue = CalculatorValue()
    
    
    // 4개가 감지되어야 함
    // - 값 변경은 CV 메서드로 처리
    private var inputNumber = ""
    private var inputOperator = ""
    private var arithmetic = ""
    private var isPositiveNumber = true
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // resetCalculator()
    }
}

// MARK: - UI

extension ViewController {
    @IBAction private func tapAllClearButton(_ sender: UIButton) {
        // TODO : View
        stackView.removeAllArrangedSubview()
        inputNumberLabel.text = "0"
        inputOperatorLabel.text = ""
        
        // resetCalculator()
    }
    
    @IBAction private func tapClearEntryButton(_ sender: UIButton) {
        // TODO : View + value
        // inputNumber = ""
        calculatorValue.resetInput(inputNumber: true, inputOperator: false)
        inputNumberLabel.text = "0"
    }
    
    
    // TODO : View + value
    private func updateStackView() {
        if calculatorValue.isNumberEmpty {
            return
        }
        
        if inputNumber.last == "." {
            inputNumber.removeLast()
        }
        
        stackView.addLable(operator: inputOperator, operand: inputNumber)
        arithmetic = arithmetic + inputOperator + inputNumber
//        inputNumber = ""
//        inputOperator = ""
        calculatorValue.resetInput(inputNumber: true, inputOperator: true)
        inputNumberLabel.text = "0"
    }
}

// TODO : View + value
extension ViewController {
    @IBAction private func tapKeypadButton(_ sender: UIButton) {
        let tappedNumber = sender.titleLabel?.text ?? "0"
        //updateInputNumber(with: tappedNumber)
        calculatorValue.updateInputNumber(with: tappedNumber)
        inputNumberLabel.text = inputNumber
    }
    
    // TODO : View + value
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
    
    // TODO : View + value
    @IBAction private func tapResultButton() {
        if calculatorValue.isArithmeticEmpty {
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
        calculatorValue.resetCalculator()
    }
    
    // TODO : View + value
    @IBAction private func tapToChangeSignButton(_ sender: UIButton) {
        calculatorValue.convertSign()
        inputNumberLabel.text = inputNumber
    }
}

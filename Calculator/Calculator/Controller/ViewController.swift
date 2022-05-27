//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputNumberLabel: UILabel!
    @IBOutlet weak var inputOperatorLabel: UILabel!
    @IBOutlet var numberButtons: [UIButton]!
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetCalculator()
    }
    
    @IBAction func tapKeypadButton(_ sender: UIButton) {
        guard let tappedNumber = numberButtons.firstIndex(of: sender) else { return }
        let newInputNumbers = Keypad.convertNumber(tappedNumber)
        checkInputNumber(number: newInputNumbers)
        inputNumberLabel.text = inputNumber
    }
    
    @IBAction func tapOperatorsButton(_ sender: UIButton) {
        updateStackView()
        
        var currentoOperator:Character = " "
        switch sender {
        case additionButton:
            currentoOperator = Operator.add.symbol
        case subtractionButton:
            currentoOperator = Operator.subtract.symbol
        case multiplicationButton:
            currentoOperator = Operator.multiply.symbol
        case divisionButton:
            currentoOperator = Operator.divide.symbol
        default:
            return
        }
        inputOperatorLabel.text = String(currentoOperator)
        inputOperator = String(currentoOperator)
    }
    
    @IBAction func tapResultButton() {
        if arithmetic.isEmpty {
            return
        }
        
        updateStackView()

        let formula = ExpressionParser.parse(from: arithmetic)
        var result = 0.0
        do {
            result = try formula.result()
            inputNumber = String(result)
            inputNumberLabel.text = inputNumber
        } catch CalculatorError.dividedByZero {
            inputNumberLabel.text = CalculatorError.dividedByZero.errorMessage
        } catch {
            inputNumberLabel.text = CalculatorError.unknownError.errorMessage
        }
        
        inputNumber = ""
        arithmetic = ""
    }
    
    @IBAction func tapAllClearButton(_ sender: UIButton) {
        resetCalculator()
    }
    
    @IBAction func tapClearEntryButton(_ sender: UIButton) {
        inputNumber = ""
        inputNumberLabel.text = "0"
    }
    
    
    @IBAction func tapToChangeSignButton(_ sender: UIButton) {
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
    
    func updateLable(text: String) {
        inputNumberLabel.text = inputNumber
    }
    
    func updateStackView() {
        let label = UILabel()
        label.text = inputOperator + inputNumber
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = .white
        stackView.addArrangedSubview(label)
        arithmetic = arithmetic + inputOperator + inputNumber
        inputNumber = ""
        inputOperator = ""
        print(arithmetic)
    }
    
    func checkInputNumber(number: String) {
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
    
    func resetCalculator() {
        stackView.removeAllArrangedSubview()
        inputNumberLabel.text = ""
        inputOperatorLabel.text = ""
        arithmetic = ""
        inputNumber = ""
        isPositiveNumber = true
        inputOperator = ""
    }
}

extension UIStackView {
    func removeAllArrangedSubview() {
        self.arrangedSubviews.forEach({ child in
            self.removeArrangedSubview(child)
            child.removeFromSuperview()
        })
    }
}

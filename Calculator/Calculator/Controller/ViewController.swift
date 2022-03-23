//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputStackView: UIStackView!
    
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var acButton: UIButton!
    @IBOutlet weak var ceButton: UIButton!
    @IBOutlet weak var prefixButton: UIButton!
    
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var subtractButton: UIButton!
    @IBOutlet weak var devideButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    
    @IBOutlet weak var dotButton: UIButton!
    
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var doubleZeroButton: UIButton!
    
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    
    @IBAction func touchUpNumberButton(_ sender: UIButton) {
        guard let input = try? findNumber(of: sender) else {
            return
        }
        let currentNumber = numberLabel.text
        
        guard isValidNumber(input: input, currentNumber: currentNumber) else {
            return
        }
        if currentNumber == "0",
           input != "." {
            numberLabel.text = input
        } else {
            numberLabel.text?.append(input)
        }
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
    }
    
    @IBAction func touchUpFunctionButton(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.text = "0"
        operatorLabel.text = ""
    }

    private func findNumber(of button: UIButton) throws -> String {
        switch button {
        case dotButton:
            return "."
        case zeroButton:
            return "0"
        case doubleZeroButton:
            return "00"
        case oneButton:
            return "1"
        case twoButton:
            return "2"
        case threeButton:
            return "3"
        case fourButton:
            return "4"
        case fiveButton:
            return "5"
        case sixButton:
            return "6"
        case sevenButton:
            return "7"
        case eightButton:
            return "8"
        case nineButton:
            return "9"
        default:
            throw CalculatorError.unexpectedData
        }
    }
    
    private func isValidNumber(input: String, currentNumber: String?) -> Bool {
        let isValidZero = true
        let isValidDot = true
        
        if currentNumber == "0", input.contains("0") {
            return !isValidZero
        }
        if ((currentNumber?.contains(".")) == true), input == "." {
            return !isValidDot
        }
        return true
    }

}


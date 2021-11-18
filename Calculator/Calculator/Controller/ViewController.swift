//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var currentOperator: UILabel!
    @IBOutlet var currentValue: UILabel!

    @IBOutlet var operandsButton: UIButton!
    @IBOutlet var operatorsButton: UIButton!
    @IBOutlet var acButton: UIButton!
    @IBOutlet var ceButton: UIButton!
    @IBOutlet var positiveOrNegativeButton: UIButton!
    
    let initialValue = "0"
    var stringToCalculate: [String] = []
    var inputOperandValues: [String] = []
    var isOperatorEnterd: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputOperandValues = [initialValue]
        isOperatorEnterd = false
    }
    
    @IBAction func hitOperandButton(_ sender: UIButton) {
        guard let inputButtonTitle = sender.titleLabel?.text else {
            return
        }
        guard isVerify(inputButtonTitle, in: inputOperandValues) else {
            return
        }
  
        let isDemicalAndInputIsNumber = inputOperandValues.first == initialValue
                                        && !inputOperandValues.contains(".")
                                        && inputButtonTitle != "."
        if isDemicalAndInputIsNumber {
            inputOperandValues.removeFirst()
        }

        inputOperandValues.append(inputButtonTitle)
        isOperatorEnterd = false
        currentValue.text = inputOperandValues.joined()
    }
    
    func isVerify(_ value: String, in pastValues: [String]) -> Bool {
        let value = value
        
        if value == "0" && pastValues.first == "0" {
            return false
        } else if value == "00" && pastValues.first == "0" {
            return false
        } else if value == "00" && pastValues.isEmpty {
            return false
        } else if value == "." && pastValues.isEmpty {
            return false
        } else if value == "." && pastValues.contains(".") {
            return false
        } else {
            return true
        }
        
    }
    
    @IBAction func hitOperatorButton(_ sender: UIButton) {
        guard let inputButtonTitle = sender.titleLabel?.text else {
            return
        }
        if isOperatorEnterd {
            stringToCalculate.removeLast()
            stringToCalculate.append(inputButtonTitle)
        } else {
            endOperandInput()
            stringToCalculate.append(inputButtonTitle)
            isOperatorEnterd = true
        }
        currentOperator.text = inputButtonTitle
    }
    
    func endOperandInput() {
        stringToCalculate.append(inputOperandValues.joined())
        inputOperandValues.removeAll()
        currentValue.text = initialValue
    }
    
    @IBAction func hitACButton(_ sender: UIButton) {
        resetToInitialState()
        currentValue.text = initialValue
    }
    
    func resetToInitialState() {
        inputOperandValues.removeAll()
        stringToCalculate.removeAll()
        currentOperator.text = ""
    }
    
    @IBAction func hitCEButton(_ sender: UIButton) {
        inputOperandValues.removeAll()
        currentValue.text = initialValue
    }
    
    @IBAction func hitCodeConversionButton(_ sender: UIButton) {
        if currentValue.text != initialValue {
            guard let currentOperand = currentValue.text,
                  let doubleTypeOperand = Double(currentOperand) else {
                return
            }
            currentValue.text = String(format: "%.4g", doubleTypeOperand * -1)
        }
    }
    
    @IBAction func hitEqualButton(_ sender: UIButton) {
        endOperandInput()
        let calculator = ExpressionParser.self
        let resultOfDouble = calculator.parse(from: stringToCalculate.joined()).result()
        if resultOfDouble.isNaN {
            resetToInitialState()
            currentValue.text = "NaN"
        } else {
            resetToInitialState()
            currentValue.text = String(format: "%.4g", resultOfDouble)
        }
    }
    
    
    
    
    


}


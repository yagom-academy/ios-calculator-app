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
        currentValue.text = initialValue
    }
    
    @IBAction func hitOperandButton(_ sender: UIButton) {
        guard let inputButtonTitle = sender.titleLabel?.text else {
            return
        }
        
        if !inputOperandValues.contains(".") {
            guard inputButtonTitle != "0" || inputOperandValues.first != "0" else {
                return
            }
            guard inputButtonTitle != "00" || inputOperandValues.first != "0" else {
                return
            }
            guard inputButtonTitle != "." || !inputOperandValues.contains(".") else {
                return
            }
        }
        inputOperandValues.append(inputButtonTitle)
        
        if !inputOperandValues.contains(".") && inputOperandValues.first == initialValue {
            inputOperandValues.removeFirst()
        }
        isOperatorEnterd = false
        currentValue.text = inputOperandValues.joined()
    }
    
    
    func endOperandInput() {
        stringToCalculate.append(inputOperandValues.joined())
        inputOperandValues = [initialValue]
        currentValue.text = initialValue
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
    
    func resetToInitialState() {
        inputOperandValues = [initialValue]
        stringToCalculate.removeAll()
        currentOperator.text = ""
    }
    
    @IBAction func hitACButton(_ sender: UIButton) {
        resetToInitialState()
        currentValue.text = initialValue
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
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
        
            currentValue.text = addCommaToValue(resultOfDouble)
        }
    }
    
    func addCommaToValue(_ value: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let resultWithComma = numberFormatter.string(for: value) else {
            return "0"
        }
        
        return resultWithComma
    }
    
    
    
    
    
    


}


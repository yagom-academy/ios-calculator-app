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
    var signIsPositive: Bool = true
    
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
        guard inputOperandValues.count <= 20 else {
            return
        }
        
        if inputOperandValues.contains(".") {   //이미 입력된 값이 소수일 때
            guard inputButtonTitle != "." else {
                return
            }
        } else {
            guard inputButtonTitle != "0" || inputOperandValues.first != "0" else {
                return
            }
            guard inputButtonTitle != "00" || inputOperandValues.first != "0" else {
                return
            }
        }
        inputOperandValues.append(inputButtonTitle)         //일단 저장
        
        if !inputOperandValues.contains(".") && inputOperandValues.first == initialValue {                      // 피연산자가 소수아닌데 첫글자 0일때 현재입력숫자로 교체
            inputOperandValues.removeFirst()
        }
        let addcommaOperand = addCommaToValue(Double(inputOperandValues.joined()) ?? 0)
        
        if signIsPositive {
            currentValue.text = addcommaOperand
        } else {
            currentValue.text = "-" + addcommaOperand
        }
        isOperatorEnterd = false
        
    }
    
    func endOperandInput() {
        if signIsPositive {
            stringToCalculate.append(inputOperandValues.joined())
        } else {
            stringToCalculate.append("-" + inputOperandValues.joined())
        }
        inputOperandValues = [initialValue]
        currentValue.text = initialValue
        signIsPositive = true
    }
    
    @IBAction func hitOperatorButton(_ sender: UIButton) {
        guard let inputButtonTitle = sender.titleLabel?.text else {
            return
        }
        endOperandInput()
        if isOperatorEnterd {
            stringToCalculate.removeLast()
            stringToCalculate.append(inputButtonTitle)
        } else {
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
        guard currentValue.text != initialValue else {
            return
        }
        guard let currentOperand = currentValue.text,
              let doubleTypeOperand = Double(currentOperand) else {
                  return
              }
        signIsPositive = !signIsPositive
        currentValue.text = String(format: "%.4g", doubleTypeOperand * -1)
    }

    
    @IBAction func hitEqualButton(_ sender: UIButton) {
        endOperandInput()
        let calculator = ExpressionParser.self
        let doubleTypeResult = calculator.parse(from: stringToCalculate.joined()).result()

        if doubleTypeResult.isNaN {
            resetToInitialState()
            currentValue.text = "NaN"
        } else {
            resetToInitialState()
            currentValue.text = addCommaToValue(doubleTypeResult)
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


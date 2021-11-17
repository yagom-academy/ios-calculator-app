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
    
    @IBAction func hitOperandButton(_ sender: UIButton) {
        guard let inputButtonTitle = sender.titleLabel?.text else {
            return
        }
        guard !inputOperandValues.isEmpty || inputButtonTitle != initialValue else {
            return
        }
        guard !inputOperandValues.isEmpty || inputButtonTitle != "00" else {
            return
        }
        guard inputButtonTitle != "." || inputOperandValues.last != "." else {
            return
        }
        
        inputOperandValues.append(inputButtonTitle)
        isOperatorEnterd = false
        currentValue.text = inputOperandValues.joined()
    }
    
    @IBAction func hitOperatorButton(_ sender: UIButton) {
        endOperandInput()
        guard let inputButtonTitle = sender.titleLabel?.text else {
            return
        }
        if isOperatorEnterd {
            stringToCalculate.removeLast()
            stringToCalculate.append(inputButtonTitle)
        } else {
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
        inputOperandValues.removeAll()
        stringToCalculate.removeAll()
        currentOperator.text = ""
        currentValue.text = initialValue
    }
    
    @IBAction func hitCEButton(_ sender: UIButton) {
        stringToCalculate.removeLast()
        currentValue.text = initialValue
    }
    
    @IBAction func hitCodeConversionButton(_ sender: UIButton) {
        if currentValue.text != initialValue {
            guard let currentOperand = currentValue.text,
                  let doubleTypeOperand = Double(currentOperand) else {
                return
            }
            currentValue.text = String(doubleTypeOperand * -1)
        }
    }
    
    @IBAction func hitEqualButton(_ sender: UIButton) {
        endOperandInput()
        let calculator = ExpressionParser.self
        let resultOfDouble = calculator.parse(from: stringToCalculate.joined()).result()
        
        currentValue.text = String(resultOfDouble)
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


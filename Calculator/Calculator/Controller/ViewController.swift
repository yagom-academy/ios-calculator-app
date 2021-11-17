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
    
    @IBAction func hitOperandButton(_ sender: UIButton) {
        guard let inputButtonTitle = sender.titleLabel?.text else {
            return
        }
        
        guard !inputOperandValues.isEmpty || inputButtonTitle != initialValue else {
            return
        }
        guard inputButtonTitle != "00" else {
            return
        }
        
        inputOperandValues.append(inputButtonTitle)
        currentValue.text = inputOperandValues.joined()
    }
    
    @IBAction func hitOperatorButton(_ sender: UIButton) {
        stringToCalculate.append(inputOperandValues.joined())
        clearCurrentValue()
        guard let inputButtenTitle = sender.titleLabel?.text else {
            return
        }
        let inputValues = inputButtenTitle
        currentOperator.text = inputValues
    }
    
    func clearCurrentValue() {
        inputOperandValues.removeAll()
        currentValue.text = initialValue
    }
    
    @IBAction func hitACButton(_ sender: UIButton) {
        inputOperandValues.removeAll()
        currentOperator.text = ""
        currentValue.text = initialValue
    }
    
    @IBAction func hitCEButton(_ sender: UIButton) {
        stringToCalculate.removeLast()
        currentValue.text = initialValue
    }
    
    @IBAction func hitCodeConversionButton(_ sender: UIButton) {
        if currentValue.text != initialValue {
            guard let conversionedValue = Double(currentValue.text ?? "") else {
                return
            }
            currentValue.text = String(conversionedValue * -1)
        }
        
    }
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


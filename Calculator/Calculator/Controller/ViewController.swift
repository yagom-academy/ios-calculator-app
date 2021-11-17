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
        guard let inputButtenTitle = sender.titleLabel?.text else {
            return
        }
        inputOperandValues.append(inputButtenTitle)
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
        stringToCalculate.removeAll()
        currentValue.text = initialValue
    }
    
    @IBAction func hitCEButton(_ sender: UIButton) {
        stringToCalculate.removeLast()
        currentValue.text = initialValue
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


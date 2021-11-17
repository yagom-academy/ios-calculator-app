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
        inputOperandValues.removeAll()
        currentValue.text = initialValue
        guard let inputButtenTitle = sender.titleLabel?.text else {
            return
        }
        let inputValues = inputButtenTitle
        currentOperator.text = inputValues
    }
    
    @IBAction func hitACButton(_ sender: UIButton) {
        stringToCalculate.removeAll()
        currentValue.text = "0"
    }
    
    @IBAction func hitCEButton(_ sender: UIButton) {
        stringToCalculate.removeLast()
        currentResult.text = "0"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


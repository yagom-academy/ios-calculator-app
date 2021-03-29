//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let decimalCalculator: DecimalInputDataValidation = DecimalInputDataValidation.sharedInstance
        decimalCalculator.manageData(input: "2")
        decimalCalculator.manageData(input: "+")
        decimalCalculator.manageData(input: "3")
        let decimalCalculation: DecimalCalculation = DecimalCalculation()
        decimalCalculation.convertToPostfixNotation()
    }


}


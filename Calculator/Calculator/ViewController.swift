//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var formula: Formula = Formula(operands: CalculatorItemQueue(), operators: CalculatorItemQueue())
        print(formula.result())
    }
}


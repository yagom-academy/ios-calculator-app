//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let calculator = CalculatorItemQueue<String>()
        calculator.enqueue("hi")
        calculator.enqueue("nice")
        calculator.enqueue("to")
        calculator.enqueue("meet")
        
        print(calculator.size)
    }
}


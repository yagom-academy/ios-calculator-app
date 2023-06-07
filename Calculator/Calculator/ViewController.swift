//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 빼기 : −
        // 음수 : -
        
        var formula = ExpressionParser<CalculatorItemQueue, CalculatorItemQueue>.parse(from: "-16*7+99+4")
    }
}


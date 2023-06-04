//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        
        var formula = ExpressionParser.parse(from: "-6*3/2+34-12")
        print(formula.result())
    }
}


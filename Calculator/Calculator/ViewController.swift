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
        
        
        var formula = ExpressionParser.parse(from: "-6*3−-2")
        print(formula.result())
    }
}


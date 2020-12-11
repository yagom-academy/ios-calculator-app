//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            let test = ["2", "-", "4", "+", "-3", "*", "3", "/", "3"]
            let result = try DecimalCalculator.shared.calculate(test)
            print("10: \(result.value)")
        } catch {
            
        }
    }
}


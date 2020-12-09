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
            let test = ["3", "+", "2"]
            let result = try DecimalCalculator.shared.calculate(test)
            print("📚: \(result.value)")
            
            let test2 = ["3", "+", "2", "*", "2"]
            let result2 = try DecimalCalculator.shared.calculate(test2)
            print("📚: \(result2.value)")
            
            let test3 = ["3", "+", "2", "*", "2", "*", "-1"]
            let result3 = try DecimalCalculator.shared.calculate(test3)
            print("📚: \(result3.value)")
            
            let test4 = ["3", "+", "-2", "*", "2", "*", "-1"]
            let result4 = try DecimalCalculator.shared.calculate(test4)
            print("📚: \(result4.value)")
            
        } catch {
            
        }
    }
}


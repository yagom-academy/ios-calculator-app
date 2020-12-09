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
            print("10📚: \(result.value)")
            
            let test2 = ["3", "+", "2", "*", "2"]
            let result2 = try DecimalCalculator.shared.calculate(test2)
            print("10📚: \(result2.value)")
            
            let test3 = ["3", "+", "2", "*", "2", "*", "-1"]
            let result3 = try DecimalCalculator.shared.calculate(test3)
            print("10📚: \(result3.value)")
            
            let test4 = ["3", "+", "-2", "*", "2", "*", "-1"]
            let result4 = try DecimalCalculator.shared.calculate(test4)
            print("10📚: \(result4.value)")
            
            let test5 = ["1011", "+", "1111", "*", "1111"]
            let result5 = try BinaryCalculator.shared.calculate(test5)
            print("2📚: \(result5.value)")
            
            let s = "1011"
            let s1 = "1111"
            let s2 = "1111"
            let a = Int(s, radix: 2)
            let a2 = Int(s1, radix: 2)
            let a3 = Int(s2, radix: 2)
            var r = a2! * a3!
            r = r + a!
            print(r)
            print(String(r, radix: 2))
            
        } catch {
            
        }
    }
}


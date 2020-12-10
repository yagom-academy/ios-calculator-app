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
            
            let test7 = ["2","-","4","+","-3","*","3","/","3"]
            let result7 = try DecimalCalculator.shared.calculate(test7)
            print("10📚: \(result7.value)")
            
            let test8 = ["3.2", "+", "2"]
            let result8 = try DecimalCalculator.shared.calculate(test8)
            print("10📚: \(result8.value)")
            
            let test6 = ["1011", "+", "1111", "AND", "1111", "NOT"]
            let result6 = try BinaryCalculator.shared.calculate(test6)
            print("2📚: \(result6.value)")
            
            let test9 = ["1111", "NOT"]
            let result9 = try BinaryCalculator.shared.calculate(test9)
            print("2📚: \(result9.value)")
            
        } catch {
            
        }
    }
}


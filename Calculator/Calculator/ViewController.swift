//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit
// TODO: 이진 계산기에서 not, shift는 식에 넣을때 바로 변환해서 넣어주기?
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
            
            let test6 = ["1011", "+", "1111", "*", "1111", "NOT"]
            let result6 = try BinaryCalculator.shared.calculate(test6)
            print("2📚: \(result6.value)")
            
        } catch {
            
        }
    }
}


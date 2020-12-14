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
            
            let decimal = DecimalCalculator()
            let dR = try decimal.subtract(first: "13.4", second: "5.8")
            print(dR)
            
            let binary = BinaryCalculator()
            let result = try binary.calculate(["1010","~|","1111"])
            let result2 = try binary.calculate(["1010", "~"])
            print(result)
            print(result2)
        } catch {
            
        }
    }


}


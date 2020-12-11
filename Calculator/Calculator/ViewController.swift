//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var decimalCalculator = DecimalCalculator()
    var binaryCalculator = BianryCalculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("1011 + 1111 & 1111 ~ = ", terminator: "")
        _ = try! binaryCalculator.enterNumber("1")
        _ = try! binaryCalculator.enterNumber("0")
        _ = try! binaryCalculator.enterNumber("1")
        _ = try! binaryCalculator.enterNumber("1")
        _ = try! binaryCalculator.add()
        _ = try! binaryCalculator.enterNumber("1")
        _ = try! binaryCalculator.enterNumber("1")
        _ = try! binaryCalculator.enterNumber("1")
        _ = try! binaryCalculator.enterNumber("1")
        _ = try! binaryCalculator.and()
        _ = try! binaryCalculator.enterNumber("1")
        _ = try! binaryCalculator.enterNumber("1")
        _ = try! binaryCalculator.enterNumber("1")
        _ = try! binaryCalculator.enterNumber("1")
        _ = try! binaryCalculator.not()
        print(try! binaryCalculator.equal())
        
        print("10 - 3 * 8 = ", terminator: "")
        _ = try! decimalCalculator.enterNumber("1")
        _ = try! decimalCalculator.enterNumber("0")
        _ = try! decimalCalculator.subtract()
        _ = try! decimalCalculator.enterNumber("3")
        _ = try! decimalCalculator.multiply()
        _ = try! decimalCalculator.enterNumber("8")
        print(try! decimalCalculator.equal())
    }
}


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
        
        print("1011 + 1111 & 1111 ~ = ")
        try! binaryCalculator.enterNumber("1")
        try! binaryCalculator.enterNumber("0")
        try! binaryCalculator.enterNumber("1")
        try! binaryCalculator.enterNumber("1")
        try! binaryCalculator.add()
        try! binaryCalculator.enterNumber("1")
        try! binaryCalculator.enterNumber("1")
        try! binaryCalculator.enterNumber("1")
        try! binaryCalculator.enterNumber("1")
        try! binaryCalculator.and()
        try! binaryCalculator.enterNumber("1")
        try! binaryCalculator.enterNumber("1")
        try! binaryCalculator.enterNumber("1")
        try! binaryCalculator.enterNumber("1")
        try! binaryCalculator.not()
        print(try! binaryCalculator.equal())
        
        print("10 - 3 = ")
        try! decimalCalculator.enterNumber("1")
        try! decimalCalculator.enterNumber("0")
        try! decimalCalculator.subtract()
        try! decimalCalculator.enterNumber("3")
        print(try! decimalCalculator.equal())
    }
}


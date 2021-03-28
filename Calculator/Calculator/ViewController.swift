//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let decimalCalculator = DecimalCalculator.shared
    let binaryCalculator = BinaryCalculator.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func testDecimalCalculator(by text: String) {
        print("----Decimal----")
        decimalCalculator.appendPostfixedList(contentsOf: text)
        decimalCalculator.equal()
    }
    
    func testBinaryCalculator(by text: String) {
        print("----Binary----")
        binaryCalculator.appendPostfixedList(contentsOf: text)
        binaryCalculator.equal()
    }
}

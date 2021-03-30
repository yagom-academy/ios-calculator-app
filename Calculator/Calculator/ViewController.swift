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
        testDecimalCalculator(by: "99999 * 99999")
        testBinaryCalculator(by: "1011 << 11111111 | 100011")
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

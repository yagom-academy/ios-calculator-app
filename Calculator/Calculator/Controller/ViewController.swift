//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var result = ExpressionParser.parse(from: "9 + 5 - 2 / 3 * 5")
        var result2 = result.result()
        // Do any additional setup after loading the view.
    }
}


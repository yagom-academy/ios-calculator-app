//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func random(_ sender: Any) {
        let calculator = Calculator()
        let postfix = calculator.calculate(infix: ["7", "+", "3", "x", "3", "+", "4"])
        print(postfix)
    }
    
}


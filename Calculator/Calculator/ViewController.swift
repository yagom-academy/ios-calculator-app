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
        let cal = Calculator()
        do {
            try cal.calculate(infix: ["7", "+", "3", "*", "3", "+", "4"])
           
        } catch {
            print(error.localizedDescription)
        }
      
    }

    
}


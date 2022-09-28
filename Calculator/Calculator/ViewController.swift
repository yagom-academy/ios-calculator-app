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
        let a = Formula()
        var 오퍼랜즈 = a.operands
        오퍼랜즈.enqueue(10)
        print(오퍼랜즈)
    }


}


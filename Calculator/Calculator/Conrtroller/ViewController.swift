//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        var a = CalculatorItemQueue()
        a.enqueue("2")
        a.itemQueue.append("2")
        
        // Do any additional setup after loading the view.
    }
}


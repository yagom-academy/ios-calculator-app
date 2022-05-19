//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var testQueue: CalculatorItemQueue = CalculatorItemQueue<Any>()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        testQueue.enqueue(10)
        testQueue.enqueue(20)
        // testQueue.dequeue()
        testQueue.enqueue(30)
    }
}


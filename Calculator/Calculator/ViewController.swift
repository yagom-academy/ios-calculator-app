//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let testQueue: CalculatorItemQueue = CalculatorItemQueue<Any>()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        testPrint()
        print(testQueue.linkedList.head?.data)
    }
    
    func testPrint() {
        testQueue.enqueue(10)
        testQueue.enqueue(20)
        testQueue.enqueue(30)
        testQueue.linkedList.removeFirst()
        testQueue.enqueue(40)

    }
}


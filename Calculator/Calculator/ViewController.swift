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


}

protocol CalculateItem {
    
}

struct CalculatorItemQueue: CalculateItem {
    
}

class List<D> {
    var prev: List?
    var data: D?
    var next: List?
    
    init (prev: List? = nil, data: D?, next: List? = nil) {
        self.prev = prev
        self.data = data
        self.next = next
    }
}

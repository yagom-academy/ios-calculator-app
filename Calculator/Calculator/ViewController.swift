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

struct CalculatorItemQueue<D>: CalculateItem {
    var head: List<D>?
 
}

class List<D> {
    var data: D?
    var next: List?
    
    init (data: D?, next: List? = nil) {
        self.data = data
        self.next = next
    }
}

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
    
    mutating func enQueue(data: D?) {
        if head == nil {
            head = List(data: data)
            return
        }
        var node = head
        while node?.next != nil {
            node = node?.next
        }
    }
}

class List<D> {
    var data: D?
    var next: List?
    
    init (data: D?, next: List? = nil) {
        self.data = data
        self.next = next
    }
}

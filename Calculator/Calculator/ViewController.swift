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
    var tail: List<D>?
    
    mutating func enQueue(data: D?) {
        if head == nil || tail == nil {
            head = List.init(data: data)
            tail = head
            return
        }
        let newList = List.init(data: data)
        tail?.next = newList
        newList.prev = tail
        tail = newList
    }
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

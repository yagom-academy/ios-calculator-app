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

struct CalculatorItemQueue<T>: CalculateItem {
    var head: Node<T>?
    
    mutating func enQueue(data: T?) {
        if head == nil {
            head = Node(data: data)
            return
        }
        var node = head
        while node?.next != nil {
            node = node?.next
        }
    }
    
    mutating func deQueue() {
        if head == nil { return }
        head = head?.next
    }

class Node<T> {
    var data: T?
    var next: Node?
    
    init (data: T?, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}
}

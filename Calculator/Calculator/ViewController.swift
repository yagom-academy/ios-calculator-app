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

class CalculatorItemQueue<T>: CalculateItem {
    
    var linkedList = LinkedList<T>()
    
    func enQueue(_ data: T) {
        linkedList.append(data: data)
    }
    
    func deQueue() {
        linkedList.remove()
    }
}

struct LinkedList<T> {
    var head: Node<T>?
    
    var count: Int {
        guard var node = head else { return 0 }
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
    
    mutating func append(data: T?) {
        if head == nil {
            head = Node(data: data)
            return
        }
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        node?.next = Node(data: data)
    }
    
    mutating func remove() {
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

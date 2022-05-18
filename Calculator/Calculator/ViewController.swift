//
//  Calculator - ViewController.swift
//  Created by unchain123
//
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

class LinkedList<T> {
    var head: Node<T>?
    
    var count: Int {
        guard var node = head else {
            return 0
        }
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
    
    func append(data: T?) {
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
    
    func remove() {
        if head == nil {
            return
        }
        head = head?.next
    }
    func removeAll() {
        while head != nil {
            head = head?.next
        }
    }
}

class Node<T> {
    var data: T?
    var next: Node?
    
    init (data: T?, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}


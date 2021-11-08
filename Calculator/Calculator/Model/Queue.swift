//
//  Queue.swift
//  Calculator
//
//  Created by 고은 on 2021/11/09.
//

import Foundation

class Queue: LinkedList {
    let linkedList = LinkedList()
    
    func enqueue(_ value: String) {
        linkedList.insert(value)
    }
    
    func dequeue() {
        if let firstElement = linkedList.head?.value {
            linkedList.delete(firstElement)
        }
    }
    
    override func test_Elements() -> [String] {
        super.test_Elements()
    }
}

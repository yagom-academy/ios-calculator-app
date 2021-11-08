//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 박병호 on 2021/11/08.
//

import Foundation

struct CalculatorItemQueue<T> {

    var front: Node<T>?
    
    init(front: Node<T>? = nil) {
        self.front = front
    }
    
    mutating func enQueue(_ data: T?) {
        if front == nil {
            front = Node(data: data)
            return
        }
        
        var node = front
        while node?.next != nil {
            node = node?.next
        }
        node?.next = Node(data: data)
    }
    
    mutating func deQueue() {
        if front == nil {
            return
        }
        front = front?.next
    }
    
    func removeAll() {
        
    }
    
    mutating func returnQueue() -> Array<T> {
        var queue: Array<T> = []
        var node = front
        
        while node?.data != nil {
            guard let data = node?.data else {
                return []
            }
            queue.append(data)
            node = node?.next
        }
        return queue
    }
}

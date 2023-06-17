//
//  MockCalculatorItemQueue.swift
//  Calculator
//
//  Created by kyungmin, EtialMoon on 2023/06/02.
//

import Foundation

struct MockCalculatorItemQueue: CalculatorItemQueueProtocol {
    typealias T = Any
    var linkedList = LinkedList<T>()
    
    var first: Node<T>? {
        return linkedList.first
    }
    
    var last: Node<T>? {
        return linkedList.last
    }
    
    mutating func enqueue(_ element: T) {
        linkedList.enqueue(element)
    }
    
    @discardableResult
    mutating func dequeue() -> T? {
        return linkedList.dequeue()
    }
}

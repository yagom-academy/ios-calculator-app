//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Minseong Kang on 2022/05/18.
//

import Foundation

struct CalculatorItemQueue<Element> {
    // MARK: - Properties
    
    private(set) var queue = LinkedList<Element>()
    
    var peek: Element? {
        return queue.head?.data ?? nil
    }
    
    // MARK: - Action
    
    mutating func enqueue(_ data: Element) {
        queue.append(Node(data))
    }
    
    mutating func dequeue() -> Node<Element>? {
        return queue.isEmpty() == true ? nil : queue.removeFirstNode()
    }
}

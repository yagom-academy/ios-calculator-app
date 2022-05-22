//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Minseong Kang on 2022/05/18.
//

import Foundation

protocol Queue {
    associatedtype Element
    
    // MARK: - Properties
    
    var peek: Element? { get }
    
    // MARK: - Action
    
    mutating func enqueue(_ data: Element)
    mutating func dequeue() -> Node<Element>?
    func isEmpty() -> Bool
}

struct CalculatorItemQueue<Element: CalculateItem>: Queue {
    
    // MARK: - Properties
    
    private var queue = LinkedList<Element>()
    
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
    
    func isEmpty() -> Bool {
        return queue.length == 0 ? true : false
    }
}

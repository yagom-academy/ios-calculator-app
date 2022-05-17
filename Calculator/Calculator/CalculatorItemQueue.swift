//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 이은찬 on 2022/05/16.
//

import Foundation

struct CalculatorItemQueue<T> : CalculateItem {
    private var calculatorItemQueue = LinkedList<T>()
    private var head: Node<T>?
    
    public var count: Int {
        return calculatorItemQueue.count
    }
    
    public var isEmpty: Bool {
        return calculatorItemQueue.isEmpty
    }
    
    public var firstValue: T? {
        return calculatorItemQueue.returnFirst()?.value
    }
    
    public mutating func enqueue(_ element: T) {
        calculatorItemQueue.append(element)
    }
    
    public mutating func dequeue() -> Node<T>? {
        return isEmpty ? nil : calculatorItemQueue.removeHead()
    }
    
    public mutating func removeAll() {
        calculatorItemQueue.removeAll()
    }
}

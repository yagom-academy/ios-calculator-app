//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by kangkyungmin on 2023/05/30.
//
protocol CalculateItem {
    
}

struct CalculatorItemQueue<T> {
    var linkedList = LinkedList<T>()
    
    mutating func enqueue(_ element: T) {
        linkedList.enqueue(element)
    }
    
    mutating func dequeue() -> T? {
        return linkedList.dequeue()
    }
}

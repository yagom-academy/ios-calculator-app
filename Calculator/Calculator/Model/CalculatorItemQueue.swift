//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by kangkyungmin on 2023/05/30.
//

struct CalculatorItemQueue<T: CalculateItem>: CalculatorItemQueueProtocol {
    private var linkedList = LinkedList<T>()
    
    var first: Node<T>? {
        return linkedList.first
    }
    
    var last: Node<T>? {
        return linkedList.last
    }
    
    mutating func enqueue(_ element: T) {
        linkedList.enqueue(element)
    }
    
    mutating func dequeue() -> T? {
        return linkedList.dequeue()
    }
}

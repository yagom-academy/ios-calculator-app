//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by MARY on 2023/05/30.
//

struct CalculatorItemQueue {
    private var queue = CalculatorItemLinkedList()
    var isEmpty: Bool { queue.size == 0 }
    
    mutating func enqueue(_ element: CalculateItem) {
        queue.append(element)
    }
    
    mutating func dequeue() -> CalculateItem? {
        return queue.removeFirst()
    }
    
    mutating func removeAll() {
        queue.removeAll()
    }
}

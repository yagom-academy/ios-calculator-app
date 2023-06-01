//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by MARY on 2023/05/30.
//

struct CalculatorItemQueue: Queueable {
    private var queue = LinkedList<CalculateItem>()
    var peek: CalculateItem? { queue.peek() }
    
    mutating func enqueue(_ item: CalculateItem) {
        queue.append(item)
    }
    
    mutating func dequeue() -> CalculateItem? {
        return queue.removeFirst()
    }
    
    mutating func removeAll() {
        queue.removeAll()
    }
}

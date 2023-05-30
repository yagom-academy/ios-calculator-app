//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Erick on 2023/05/29.
//

struct CalculatorItemQueue {
    var queue = CalculaterItemLinkedList()
    
    var count: Int {
        return queue.count
    }
    
    var isEmpty: Bool {
        return queue.head == nil
    }
    
    mutating func enqueue(_ calculateItem: CalculateItem) {
        queue.apend(CalculateItemNode(item: calculateItem))
    }
    
    mutating func dequeue() -> CalculateItem? {
        return queue.removeFirst()?.item
    }
}

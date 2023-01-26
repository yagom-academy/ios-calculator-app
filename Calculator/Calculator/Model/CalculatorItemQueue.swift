//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by kokkilE on 2023/01/25.
//

struct CalculatorItemQueue<T: CalculateItem> {
    private var calculateItems = LinkedList<T>()
    
    var calculateItemsCount: Int {
        return calculateItems.count
    }
    
    mutating func enqueueCalculateItems(_ node: Node<T>) {
        calculateItems.push(node)
    }
    
    mutating func dequeueCalculateItems() -> Node<T>? {
        return calculateItems.removeLast()
    }
}

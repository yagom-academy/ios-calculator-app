//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by kokkilE on 2023/01/25.
//

struct CalculatorItemQueue<T: CalculateItem> {
    private var calculateItems = List<T>()
    
    var userInputDataCount: Int {
        return calculateItems.count
    }
    
    mutating func enqueueCalculateItems(_ data: T) {
        let node = Node(data)
        calculateItems.push(node)
    }
    
    mutating func dequeueCalculateItems() -> Node<T>? {
        return calculateItems.removeLast()
    }
}

//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by MARY on 2023/05/30.
//

protocol CalculateItem { }

final class CalculatorItemQueue: CalculateItem {
    var itemQueue: [String?] = []
    private var head = 0
    private var size: Int {
        return itemQueue.count
    }
    
    func enqueue(_ element: String) {
        itemQueue.append(element)
    }
    
    func dequeue() -> String? {
        guard head <= size,
              let element = itemQueue[head] else { return nil }
        itemQueue[head] = nil
        head += 1
        return element
    }
    
    func resetQueue() {
        itemQueue = []
    }
}

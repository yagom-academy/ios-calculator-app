//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by myungsun on 2023/05/30.
//

final class CalculatorItemQueue {
    private var items: [CalculateItem] = []
    
    func enqueue(item: CalculateItem) {
        items.append(item)
    }
    
    func dequeue() -> CalculateItem? {
        guard !isEmpty() else { return nil }
        
        return items.removeFirst()
    }
    
    func clear() {
        items.removeAll()
    }
    
    func isEmpty() -> Bool {
        return items.isEmpty ? true : false
    }
}

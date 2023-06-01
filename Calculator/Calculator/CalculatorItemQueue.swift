//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 박종화 on 2023/05/30.
//
struct CalculatorItemQueue<CalculatorItem> {
    private var queue: [CalculatorItem] = []
    
    internal var count: Int {
        return queue.count
    }
    
    internal var isEmpty: Bool {
        return queue.isEmpty
    }
    
    internal mutating func enqueue(_ element: CalculatorItem) {
        queue.append(element)
    }
    
    internal mutating func dequeue() -> CalculatorItem? {
        return isEmpty ? nil : queue.removeFirst()
    }
    
    internal mutating func clear() {
        queue.removeAll()
    }
}

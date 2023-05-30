//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 박종화 on 2023/05/30.
//
struct CalculatorItemQueue<Element>: CalculatorItem {
    private var queue: [Element] = []
    
    public var count: Int {
        return queue.count
    }
    
    public var isEmpty: Bool {
        return queue.isEmpty
    }
    
    public mutating func enqueue(_ element: Element) {
        queue.append(element)
    }
    
    public mutating func dequeue() -> Element? {
        return isEmpty ? nil : queue.removeFirst()
    }
    
    public mutating func clear() {
        queue.removeAll()
    }
}

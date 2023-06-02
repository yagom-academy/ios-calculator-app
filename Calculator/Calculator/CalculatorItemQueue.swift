//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 박종화 on 2023/05/30.
//
struct CalculatorItemQueue<Element: CalculatorItem> {
    private var queue: [Element] = []
    
    internal var count: Int {
        return queue.count
    }
    
    internal var isEmpty: Bool {
        return queue.isEmpty
    }
    
    internal mutating func enqueue(_ element: Element) {
        queue.append(element)
    }
    
    internal mutating func dequeue() -> Element? {
        return isEmpty ? nil : queue.removeFirst()
    }
    
    public mutating func clear() {
        queue.removeAll()
    }
}

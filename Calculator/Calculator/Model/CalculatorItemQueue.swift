//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Hamo on 2022/09/20.
//

struct CalculatorItemQueue<Element: CalculateItem> {
    private var queue = LinkedList<Element>()
    
    mutating func enqueue(_ data: Element) {
        queue.append(data)
    }
    
    mutating func dequeue() -> Element? {
        return queue.removeFirst()
    }
    
    mutating func removeAll() {
        queue.removeAll()
    }
    
    func bringQueue() -> LinkedList<Element> {
        return queue
    }
}

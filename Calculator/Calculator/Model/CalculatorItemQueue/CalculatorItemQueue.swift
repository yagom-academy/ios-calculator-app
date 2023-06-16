//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Zion & Dasan on 2023/05/30.
//

struct CalculatorItemQueue<Element: CalculateItem>: Queueable {
    private var queue: LinkedList<Element> = LinkedList()
    
    mutating func enqueue(_ data: Element) {
        queue.append(data)
    }
    
    mutating func dequeue() -> Element? {
        return queue.removeFirst()
    }
}

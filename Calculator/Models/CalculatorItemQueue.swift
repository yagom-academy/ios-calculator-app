//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Yejin Hong on 2024/02/05.
//

struct CalculatorItemQueue<Element: CalculateItem> {
    private var list = LinkedList<Element>()
    
    var isEmpty: Bool {
        list.isEmpty
    }
    
    var size: Int {
        list.size()
    }
    
    mutating func dequeue() -> Element? {
        return list.pop()
    }
    
    mutating func enqueue(_ value: Element) {
        list.append(value)
    }
    
    mutating func peek() -> Element? {
        return list.peek()
    }
    
    mutating func clear() {
        list.clear()
    }
}

//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Harry on 2023/01/24.
//

struct CalculatorItemQueue<Element: CalculateItem> {
    private(set) var list: LinkedList<Element>
    
    mutating func enqueue(_ element: Element) {
        list.appendLast(element)
    }
    
    mutating func dequeue() -> Element? {
        guard let element = list.removeFirst() else { return nil }
        
        return element
    }
    
    mutating func removeAll() {
        list.removeAll()
    }
}

//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by idinaloq on 2023/05/29.
//

struct CalculatorItemQueue<Element: CalculateItem> {
    private(set) var list: LinkedList<Element> = LinkedList()
    
    mutating func enqueue(_ value: Element) {
        list.appendLast(data: value)
    }
    
    mutating func dequeue() -> Element? {
        let removedData = list.removeFirst()
        return removedData
    }
    
    mutating func removeAll() {
        list.removeAll()
    }
}

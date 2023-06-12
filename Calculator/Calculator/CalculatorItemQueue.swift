//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by redmango1446 on 2023/05/30.
//

struct CalculatorItemQueue<Element: CalculateItem> {
    private var list: LinkedList<Element> = LinkedList()
    
    var first: Element? {
        return list.first
    }
    
    var last: Element? {
        return list.last
    }
    
    var count: Int {
        return list.count
    }
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    mutating func enqueue(_ newElement: Element) {
        list.append(newElement)
    }
    
    mutating func dequeue() -> Element? {
        return list.popFirst()
    }
}

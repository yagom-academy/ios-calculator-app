//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Rowan on 2023/01/24.
//

struct CalculatorItemQueue<Element: CalculateItem> {
    private var list: LinkedList<Element>
    
    var itemCount: Int {
        return self.list.count
    }
    
    var isEmpty: Bool {
        return self.list.isEmpty
    }
    
    mutating func enqueue(_ element: Element) {
        list.appendLast(element)
    }
    
    @discardableResult
    mutating func dequeue() -> Element? {
        guard let element = list.removeFirst() else { return nil }
        
        return element
    }
    
    mutating func removeAll() {
        list.removeAll()
    }
    
    init(list: LinkedList<Element>) {
        self.list = list
    }
}

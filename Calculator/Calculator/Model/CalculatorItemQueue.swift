//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Minsup on 2023/05/30.
//

struct CalculatorItemQueue<Element: CalculateItem> {    
    var elements: [Element]
    var outStack: [Element]
    
    init(_ elements:[Element] = []) {
        self.elements = elements
        self.outStack = []
    }
    
    mutating func enqueue(_ element: Element) {
        self.elements.append(element)
    }
    
    mutating func dequeue() -> Element? {
        if outStack.isEmpty {
            outStack = elements.reversed()
            elements.removeAll()
        }
        return outStack.popLast()
    }
    
    mutating func clear() {
        self.elements.removeAll()
        self.outStack.removeAll()
    }
    
    var isEmpty: Bool {
        return self.elements.isEmpty && self.outStack.isEmpty
    }
    
    var count: Int {
        return self.elements.count + self.outStack.count
    }
}

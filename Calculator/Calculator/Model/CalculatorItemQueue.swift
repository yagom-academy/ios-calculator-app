//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Minsup on 2023/05/30.
//

struct CalculatorItemQueue<Element: CalculateItem> {    
    var inStack: [Element]
    var outStack: [Element]
    
    init(_ elements:[Element] = []) {
        self.inStack = elements
        self.outStack = []
    }
    
    mutating func enqueue(_ element: Element) {
        self.inStack.append(element)
    }
    
    mutating func dequeue() -> Element? {
        if outStack.isEmpty {
            outStack = inStack.reversed()
            inStack.removeAll()
        }
        return outStack.popLast()
    }
    
    mutating func clear() {
        self.inStack.removeAll()
        self.outStack.removeAll()
    }
    
    var isEmpty: Bool {
        return self.inStack.isEmpty && self.outStack.isEmpty
    }
    
    var count: Int {
        return self.inStack.count + self.outStack.count
    }
}

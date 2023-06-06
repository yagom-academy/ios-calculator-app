//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Erick on 2023/05/29.
//

struct CalculatorItemQueue<Element: CalculateItem> {
    private var inStack: [Element] = []
    private var outStack: [Element] = []
    
    var count: Int {
        return inStack.count + outStack.count
    }
    
    var isEmpty: Bool {
        return inStack.isEmpty && outStack.isEmpty
    }
    
    mutating func enqueue(_ calculateItem: Element) {
        inStack.append(calculateItem)
    }
    
    @discardableResult
    mutating func dequeue() -> Element? {
        if outStack.isEmpty {
            outStack = inStack.reversed()
            inStack.removeAll()
        }
        return outStack.popLast()
    }
    
    mutating func clear() {
        inStack.removeAll()
        outStack.removeAll()
    }
}

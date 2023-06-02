//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Erick on 2023/05/29.
//

struct CalculatorItemQueue<element: CalculateItem> {
    private var inStack: [element] = []
    private var outStack: [element] = []
    
    var count: Int {
        return inStack.count + outStack.count
    }
    
    var isEmpty: Bool {
        return inStack.isEmpty && outStack.isEmpty
    }
    
    mutating func enqueue(_ calculateItem: element) {
        inStack.append(calculateItem)
    }
    
    @discardableResult
    mutating func dequeue() -> element? {
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

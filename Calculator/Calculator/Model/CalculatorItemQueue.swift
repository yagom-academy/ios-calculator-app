//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by myungsun on 2023/05/30.
//

struct CalculatorItemQueue<T>: CalculateItem {
    private var inStack: [T] = []
    private var outStack: [T] = []
    
    mutating func enqueue(_ data: T) {
        inStack.append(data)
    }

    mutating func dequeue() -> T? {
        guard !isEmpty() else { return nil }
        
        if outStack.isEmpty {
            while let data = inStack.popLast() {
                outStack.append(data)
            }
        }
        
        return outStack.popLast()
    }
    
    func isEmpty() -> Bool {
        return inStack.isEmpty && outStack.isEmpty
    }
    
    mutating func clear() {
        inStack = []
        outStack = []
    }
}

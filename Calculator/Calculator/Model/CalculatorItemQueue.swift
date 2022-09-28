//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by junho lee on 2022/09/20.
//

struct CalculatorItemQueue<T: CalculateItem> {
    private var enqueueStack: Array<T> = []
    private var dequeueStack: Array<T> = []
    var isEmpty: Bool {
        return enqueueStack.isEmpty && dequeueStack.isEmpty
    }
    
    mutating func enqueue(_ element: T) {
        enqueueStack.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> T? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        return dequeueStack.popLast()
    }
}

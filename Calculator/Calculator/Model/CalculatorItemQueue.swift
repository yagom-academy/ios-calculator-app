//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Kiwi, Wongbing on 2022/05/17.
//

struct CalculatorItemQueue<T>: CalculateItem {
    private var dequeueStack = Array<T>()
    private var enqueueStack = Array<T>()
    var isEmpty: Bool {
        return dequeueStack.isEmpty && enqueueStack.isEmpty
    }
    var peek: T? {
        return !dequeueStack.isEmpty ? dequeueStack.last : enqueueStack.first
    }
    var currentStack: [T] {
        return dequeueStack.reversed() + enqueueStack
    }
    var count: Int {
        return (dequeueStack + enqueueStack).count
    }
    
    init(stack: Array<T>) {
        self.enqueueStack = stack
    }
    
    mutating func enqueue(_ element: T) {
        enqueueStack.append(element)
    }
    
    mutating func dequeue() throws -> T {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        
        guard let result = dequeueStack.popLast() else {
            throw CalculatorError.emptyStack
        }
        return result
    }
}

//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 김동용 on 2022/05/16.
//

struct CalculatorItemQueue<T>: Queue {
    var leftStack: Array<T> = []
    var rightStack: Array<T> = []
    
    var isEmpty: Bool {
        return (leftStack.isEmpty && rightStack.isEmpty)
    }
    
    var peek: T? {
        if !leftStack.isEmpty {
            return leftStack.first
        } else {
            return rightStack.last
        }
    }
    
    mutating func enQueue(_ T: T) -> Bool {
        leftStack.append(T)
        return true
    }
    
    mutating func deQueue() -> T? {
        if rightStack.isEmpty {
            rightStack = leftStack.reversed()
            leftStack.removeAll()
        }
        return rightStack.popLast()
    }
}

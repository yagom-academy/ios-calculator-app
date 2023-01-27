//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Seoyeon Hong on 2023/01/26.
//
//MARK: Queue 타입 구현

struct CalculatorItemQueue<T: CalculateItem> {
    
    private var leftStack: [T] = []
    private var rightStack: [T] = []
    
    init() {}
    
    var isEmpty: Bool {
        leftStack.isEmpty && rightStack.isEmpty
    }
    
    var peek: T? {
        !leftStack.isEmpty ? leftStack.last : rightStack.first
    }
    
    mutating func enqueue(_ element: T) {
        rightStack.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> T? {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
        return leftStack.popLast()
    }
    
}


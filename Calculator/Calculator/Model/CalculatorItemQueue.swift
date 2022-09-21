//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by smfc on 19/9/2022.
//

struct CalculatorItemQueue<T: CalculateItem>  {
    var leftStack: [CalculateItem] = []
    var rightStack: [CalculateItem] = []
    
    mutating func enqueue(_ element: T) {
        rightStack.append(element)
    }
    
    mutating func count() -> Int {
        return leftStack.count + rightStack.count
    }
    
    func isEmpty() -> Bool {
        return leftStack.isEmpty && rightStack.isEmpty
    }
    
    mutating func clear() {
        leftStack.removeAll()
        rightStack.removeAll()
    }
    
    mutating func dequeue() -> T? {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
        return leftStack.popLast() as? T
    }
    
    func peek() -> T? {
        if leftStack.isEmpty && rightStack.isEmpty {
            return nil
        } else if leftStack.isEmpty {
            return rightStack.first as? T
        } else {
            return leftStack.last as? T
        }
    }
}

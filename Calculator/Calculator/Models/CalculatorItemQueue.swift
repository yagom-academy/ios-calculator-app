//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Charles on 2023/10/05.
//

struct CalculatorItemQueue<T: CalculateItem> {
    var leftContainer: [T] = []
    var rightContainer: [T] = []
    
    var isEmpty: Bool {
        leftContainer.isEmpty && rightContainer.isEmpty
    }
    
    var peek: T? {
        !leftContainer.isEmpty ? leftContainer.last : rightContainer.first
    }
    
    mutating func dequeue() -> T? {
        if leftContainer.isEmpty {
            leftContainer = rightContainer.reversed()
            rightContainer.removeAll()
        }
        
        return leftContainer.popLast()
    }
}

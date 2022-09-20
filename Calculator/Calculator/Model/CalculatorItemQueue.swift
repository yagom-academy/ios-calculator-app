//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by SummerCat on 2022/09/20.
//

import Foundation

protocol CalculateItem {
    
}

struct CalculatorItemQueue<T: CalculateItem> {
    var inputStack: [T] = []
    var outputStack: [T] = []
    var isEmpty: Bool {
        return inputStack.isEmpty && outputStack.isEmpty
    }
    
    mutating func enqueue(item: T) {
        inputStack.append(item)
    }
    
    mutating func dequeue() -> T? {
        if isEmpty { return nil }
        
        if outputStack.isEmpty {
            outputStack = inputStack.reversed()
            inputStack.removeAll()
        }
        
        return outputStack.removeLast()
    }
}

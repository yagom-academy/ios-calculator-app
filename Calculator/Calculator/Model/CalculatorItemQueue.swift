//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 정선아 on 2022/09/19.
//

import Foundation

struct CalculatorItemQueue<T>: CalculatorItem {
    var inputStack: [T] = []
    var outputStack: [T] = []
    var isEmpty: Bool {
        return inputStack.isEmpty && outputStack.isEmpty
    }
    
    mutating func enQueue(element: T) {
        inputStack.append(element)
    }
    
    mutating func deQueue() -> T? {
        if outputStack.isEmpty {
            outputStack = inputStack.reversed()
            inputStack.removeAll()
        }
        return outputStack.popLast()
    }
    
    mutating func clear() {
        inputStack.removeAll()
        outputStack.removeAll()
    }
}

//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by mint on 2023/05/30.
//

import Foundation

struct CalculatorItemQueue<T>: CalculatorItem {
    private var firstStack: [T] = []
    private var backwardStack: [T] = []
    var count: Int {
        return firstStack.count + backwardStack.count
    }
    var isEmpty: Bool {
        return firstStack.isEmpty && backwardStack.isEmpty
    }
    var first: T? {
        if !backwardStack.isEmpty {
            return backwardStack.last
        } else {
            return firstStack.first
        }
    }
    var last: T? {
        if !firstStack.isEmpty {
            return firstStack.last
        } else {
            return backwardStack.first
        }
    }
    
    mutating func enqueue(_ input: T) {
        firstStack.append(input)
    }
    
    mutating func dequeue() -> T? {
        guard isEmpty == false else {
            return nil
        }
        
        if backwardStack.isEmpty {
            backwardStack = firstStack.reversed()
            firstStack.removeAll()
        }
        
        return backwardStack.removeLast()
    }
    
    mutating func clear() {
        firstStack = []
        backwardStack = []
    }
}

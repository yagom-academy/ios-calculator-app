//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by mint on 2023/05/30.
//

import Foundation

struct CalculatorItemQueue<T>: CalculatorItem {
    var firstStack: [T] = []
    var backwardStack: [T] = []
    
    mutating func enqueue(_ input: T){
        firstStack.append(input)
    }
    
    mutating func reversedStack(_ stack: [T]) -> [T] {
        let output: [T]
        output = stack.reversed()
        
        return output
    }
    
    mutating func dequeue() -> T? {
        guard !firstStack.isEmpty else {
            return nil
        }
        
        backwardStack = reversedStack(firstStack)
        let output = backwardStack.popLast()
        firstStack = reversedStack(backwardStack)
        
        return output
    }
}

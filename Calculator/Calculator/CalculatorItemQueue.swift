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
    
    mutating func enQueue(_ input: T){
        firstStack.append(input)
    }
    
    private mutating func reversedStack(_ stack: [T]) -> [T] {
        let output: [T]
        output = stack.reversed()
        
        return output
    }
    
    mutating func deQueue() -> [T] {
        backwardStack = reversedStack(firstStack)
        backwardStack.removeLast()
        firstStack = reversedStack(backwardStack)
        
        return firstStack
    }
}

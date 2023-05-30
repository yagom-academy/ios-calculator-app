//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by mint on 2023/05/30.
//

import Foundation

struct CalculatorItemQueue<T> {
    var firstStack: [T] = []
    var backwardStack: [T] = []
    
    mutating func enQueue(_ input: T) -> [T] {
        firstStack.append(input)
        
        return firstStack
    }
    
    mutating func popAndBackwardPushStack(_ stack: [T]) -> [T] {
        var input = stack
        var output: [T] = []
        
        while input.isEmpty == false {
            guard let element = input.popLast() else { break }
            
            output.append(element)
        }
        
        return output
    }
    
    mutating func popLastStack(_ stack: [T]) -> [T] {
        var input = stack
        input.removeLast()
        
        return input
    }
    
    mutating func deQueue() -> [T] {
        backwardStack = popAndBackwardPushStack(firstStack)
        //backwardStack = popLastStack(backwardStack)
        backwardStack.removeLast()
        firstStack = popAndBackwardPushStack(backwardStack)
        
        return firstStack
    }
}

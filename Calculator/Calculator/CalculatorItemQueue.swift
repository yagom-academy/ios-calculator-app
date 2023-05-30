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
    
    mutating func enQueue(_ input: T){
        firstStack.append(input)
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
    
    mutating func deQueue() -> [T] {
        backwardStack = popAndBackwardPushStack(firstStack)
        backwardStack.removeLast()
        firstStack = popAndBackwardPushStack(backwardStack)
        
        return firstStack
    }
}

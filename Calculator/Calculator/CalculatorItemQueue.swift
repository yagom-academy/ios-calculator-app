//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by minsong kim on 2023/05/30.
//

import Foundation

struct CalculatorItemQueue<T> {
    var firstStack: [T] = []
    var backwardStack: [T] = []
    
    mutating func pushStack(_ input: T) -> [T] {
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
}

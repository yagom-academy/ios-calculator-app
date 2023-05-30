//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by minsong kim on 2023/05/30.
//

import Foundation

struct CalculatorItemQueue<T> {
    var firstStack: [T] = []
    
    mutating func pushStack(_ input: T) -> [T] {
        firstStack.append(input)
        
        return firstStack
    }
}

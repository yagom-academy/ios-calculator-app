//
//  Stack.swift
//  Calculator
//
//  Created by 홍정아 on 2021/06/23.
//

import Foundation

struct Stack<T> {
    var stack: Array<T> = []
    
    var isEmpty: Bool {
        return stack.isEmpty
    }
    
    mutating func push(_ element: T) {
        stack.append(element)
    }
    
    mutating func pop() -> T? {
        return stack.popLast()
    }
    
    var top: T? {
        return stack.last
    }
}


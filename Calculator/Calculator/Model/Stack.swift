//
//  Stack.swift
//  Calculator
//
//  Created by 이예원 on 2021/06/24.
//

import Foundation

struct Stack<T> {
    private var stack = Array<T>()
    
    var isEmpty: Bool {
        return stack.isEmpty
    }
    var top: T? {
        return stack.last
    }
    
    mutating func push(_ value: T) {
        stack.append(value)
    }
    mutating func pop() -> T? {
        return stack.isEmpty ? nil : stack.removeLast()
    }
}

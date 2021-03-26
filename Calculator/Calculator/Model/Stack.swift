//
//  Stack.swift
//  Calculator
//
//  Created by 잼킹 on 2021/03/26.
//

import Foundation

struct Stack<T> {
    var stack: [T] = []
    
    mutating func push(_ value: T) {
        stack.append(value)
    }
    
    mutating func pop() -> T? {
        return stack.popLast()
    }
    
    func peek() -> T? {
        return stack.last
    }
    
    func isEmpty() -> Bool {
        return stack.isEmpty
    }
    
    func isNotEmpty() -> Bool {
        return !stack.isEmpty
    }
    
    mutating func removeAll() {
        stack.removeAll()
    }
}

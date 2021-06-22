//
//  Stack.swift
//  Calculator
//
//  Created by YongHoon JJo on 2021/06/22.
//

import Foundation

struct Stack<T> {
    enum StackError: Error {
        case stackIsEmpty
    }
    
    private var stack: [T] = []
    private var top: Int = 0
    
    mutating func push(object: T) {
        stack.append(object)
        top = top + 1
    }
    
    mutating func pop() throws -> T {
        guard !isEmpty() else {
            throw StackError.stackIsEmpty
        }
        
        let target = stack[top-1]
        stack.remove(at: top-1)
        return target
    }
    
    func peek() throws -> T {
        guard !isEmpty() else {
            throw StackError.stackIsEmpty
        }
        
        return stack[top-1]
    }
    
    mutating func clear() {
        stack.removeAll()
        top = 0
    }
    
    func isEmpty() -> Bool {
        return top == 0
    }
    
    func getLength() -> Int {
        return top
    }
}



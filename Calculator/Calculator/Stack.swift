//
//  Stack.swift
//  Calculator
//
//  Created by Jinho Choi on 2020/12/15.
//

import Foundation

class Stack<T> {
    var stack: [T] = [T]()
        
    func push(value: T) {
        stack.append(value)
    }
    
    func pop() -> T {
        return stack.removeLast()
    }
    
    func peek() -> T? {
        return stack.last ?? nil
    }
    
    func isEmpty() -> Bool {
        return stack.isEmpty
    }
}

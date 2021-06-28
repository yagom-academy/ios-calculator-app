//
//  Stack.swift
//  Calculator
//
//  Created by YongHoon JJo on 2021/06/22.
//

import Foundation

enum StackError: Error {
    case stackIsEmpty
}

class Stack<T> {
    
    private var stack: [T] = []
    
    func push(object: T) {
        stack.append(object)
    }
    
    @discardableResult func pop() -> T? {
        guard !isEmpty() else {
            return nil
        }
        return stack.popLast()
    }
    
    func peek() -> T? {
        guard !isEmpty() else {
            return nil
        }
        
        return stack.last
    }
    
    func clear() {
        stack.removeAll()
    }
    
    func isEmpty() -> Bool {
        return stack.count == 0
    }
    
    func getLength() -> Int {
        return stack.count
    }
}


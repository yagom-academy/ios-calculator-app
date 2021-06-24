//
//  Stack.swift
//  Calculator
//
//  Created by YongHoon JJo on 2021/06/22.
//

import Foundation

class Stack<T> {
    enum StackError: Error {
        case stackIsEmpty
    }
    
    private var stack: [T] = []
    private var top: Int = 0
    
    func push(object: T) {
        stack.append(object)
        top = top + 1
    }
    
    @discardableResult func pop() -> T? {
        guard !isEmpty() else {
            return nil
        }
        
        let target = stack[top-1]
        stack.remove(at: top-1)
        top = top - 1
        return target
    }
    
    func peek() -> T? {
        guard !isEmpty() else {
            return nil
        }
        
        return stack[top-1]
    }
    
    func clear() {
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


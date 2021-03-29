//
//  Stack.swift
//  Calculator
//
//  Created by 천수현 on 2021/03/23.
//

final class Stack<T> {
    
    private var stack = Array<T>()
    
    var top: T? {
        return stack.last
    }
    
    var isEmpty: Bool {
        return stack.isEmpty
    }
    
    func push(_ newElement: T) {
        stack.append(newElement)
    }
    
    func pop() -> T? {
        return stack.removeLast()
    }
    
    func reset() {
        stack.removeAll()
    }
    
}

//
//  Stack.swift
//  Calculator
//
//  Created by 천수현 on 2021/03/23.
//

import Foundation
class Stack {
    
    static var shared = Stack()
    private var stack = Array<String>()
    
    var top: String? {
        return stack.last
    }
    
    var isEmpty: Bool {
        return stack.isEmpty
    }
    
    func push(_ newElement: String) {
        stack.append(newElement)
    }
    
    func pop() -> String? {
        return stack.removeLast()
    }
    
}

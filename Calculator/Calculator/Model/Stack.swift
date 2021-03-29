//
//  Stack.swift
//  Calculator
//
//  Created by 이영우 on 2021/03/22.
//

import Foundation

struct Stack<T> {
    private var array = [T]()
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
    
    mutating func push(_ element: T) {
        array.append(element)
    }
    
    @discardableResult mutating func pop() -> T? {
        return array.popLast()
    }
    
    var peek: T? {
        return array.last
    }
    
    mutating func removeAll() {
        array.removeAll()
    }
}

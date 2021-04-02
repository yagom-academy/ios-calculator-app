//
//  Stack.swift
//  Calculator
//
//  Created by TORI on 2021/04/01.
//

import Foundation

struct Stack<T> {
    private var storage = Array<T>()
    
    var count: Int {
        return storage.count
    }
    
    mutating func push(_ T: T) {
        storage.append(T)
    }
    
    mutating func pop() -> T? {
        return storage.popLast()
    }
    
    mutating func clear() {
        storage.removeAll()
    }
    
    func top() -> T? {
        return storage.last
    }
    
    func isEmpty() -> Bool {
        return storage.isEmpty
    }
}

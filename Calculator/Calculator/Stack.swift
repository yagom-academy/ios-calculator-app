//
//  Stack.swift
//  Calculator
//
//  Created by 강인희 on 2020/12/15.
//

import Foundation

struct Stack<T> {
    
    fileprivate var adder = [T]()
    
    var isEmpty: Bool {
        return adder.isEmpty
    }
    
    var count: Int {
        return adder.count
    }
    
    var top: T? {
        return adder.last
    }
    
    mutating func push(_ element: T) {
        adder.append(element)
    }
    
    mutating func pop() -> T? {
        return adder.popLast()
    }
    
    mutating func removeAll() {
        adder.removeAll()
    }
    
}

//
//  Stack.swift
//  Calculator
//
//  Created by 강인희 on 2020/12/15.
//

import Foundation

struct Stack<T> {
    
    fileprivate var array = [T]()
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
    
    var top: T? {
        return array.last
    }
    
    mutating func push(_ element: T) {
        array.append(element)
    }
    
    mutating func pop() -> T? {
        return array.popLast()
    }
    
    mutating func removeAll() {
        array.removeAll()
    }
    
}

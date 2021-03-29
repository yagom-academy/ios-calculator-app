//
//  Stack.swift
//  Calculator
//
//  Created by 이영우 on 2021/03/22.
//

import Foundation

struct Stack {
    private var array = [String]()
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
    
    mutating func push(_ element: String) {
        array.append(element)
    }
    
    @discardableResult mutating func pop() -> String? {
        return array.popLast()
    }
    
    var top: String? {
        return array.last
    }
    
    mutating func popAll() {
        array.removeAll()
    }
}

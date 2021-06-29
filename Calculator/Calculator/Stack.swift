//
//  Stack.swift
//  Calculator
//
//  Created by tae hoon park on 2021/06/25.
//

import Foundation

struct Stack<T> {
    private var stack = [T]()
    var isEmpty: Bool {
        return stack.isEmpty
    }
    var count: Int {
        return stack.count
    }
    mutating func push(element: T) {
        stack.append(element)
    }
    mutating func pop() -> T? {
        return stack.popLast()
    }
    mutating func removeAll() -> Int {
        stack.removeAll()
        return 0
    }
    var top: T? {
        return stack.last
    }
}

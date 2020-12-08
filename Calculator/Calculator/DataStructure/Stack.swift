//
//  Stack.swift
//  Calculator
//
//  Created by Wonhee on 2020/12/08.
//

import Foundation

struct Stack<T> {
    private var list = [T]()
    
    var size: Int {
        return self.list.count
    }
    var isEmpty: Bool {
        return self.list.isEmpty
    }
    func peek() -> T? {
        return self.list.last
    }
    mutating func push(_ item: T) {
        self.list.append(item)
    }
    mutating func pop() -> T? {
        return self.list.popLast()
    }
    mutating func removeAll() {
        self.list.removeAll()
    }
}

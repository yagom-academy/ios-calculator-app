//
//  Stack.swift
//  Calculator
//
//  Created by 김찬우 on 2021/03/30.
//

import Foundation

struct Stack<T> {
    var list: [T] = []
    var top: T? {
        return self.list.last
    }
    var isEmpty: Bool {
        return self.list.isEmpty
    }
    
    mutating func push(_ item: T) {
        self.list.append(item)
    }
    
    mutating func pop() -> T? {
        return self.list.popLast()
    }
    
    mutating func reset() {
        self.list.removeAll()
    }
}

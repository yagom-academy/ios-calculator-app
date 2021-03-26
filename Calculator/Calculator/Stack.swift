//
//  Stack.swift
//  Calculator
//
//  Created by 김찬우 on 2021/03/26.
//

import Foundation

struct Stack<T> {
    private(set) var list: [T] = []
    private(set) var isEmpty: Bool { return self.list.isEmpty }
    private(set) var top: T? { return self.list.last }
    
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






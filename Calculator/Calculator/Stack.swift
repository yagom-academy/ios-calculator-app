//
//  Stack.swift
//  Calculator
//
//  Created by 김찬우 on 2021/03/26.
//

import Foundation

struct Stack<T> {
    private(set) var list: [T] = []
    var isEmpty: Bool { return self.list.isEmpty }
    var top: T? { return self.list.last }
    
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

extension Stack where T: Numeric {
    mutating func sumAllElements() -> T {
        var sumResult: T = 0
        for element in self.list {
            sumResult += element
        }
        
        return sumResult
    }
}

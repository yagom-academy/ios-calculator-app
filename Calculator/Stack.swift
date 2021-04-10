//
//  Stack.swift
//  Calculator
//
//  Created by 김찬우 on 2021/03/30.
//

import Foundation

struct Stack<T> {
    var list: [T]
    
    var isEmpty: Bool {
        return self.list.isEmpty
    }
    
    func top() throws -> T {
        guard let topout = self.list.last else { throw
            StackError.poppedItemIsNil }
        return topout
    }
    
    mutating func push(_ item: T) {
        self.list.append(item)
    }
    
    mutating func pop() throws -> T {
        guard let popout = self.list.popLast() else { throw StackError.poppedItemIsNil }
        return popout
    }
    
    mutating func reset() {
        self.list.removeAll()
    }
    
    init(list: [T] = []) {
        self.list = list
    }
}


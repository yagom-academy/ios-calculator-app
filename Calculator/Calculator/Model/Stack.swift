//
//  CalculatorStack.swift
//  codingTest
//
//  Created by 윤재웅 on 2021/03/30.
//

import Foundation

struct Stack<T> {
    private var array = [T]()
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
    
    mutating func push(_ element: T) {
        array.append(element)
    }
    
    mutating func pop() -> T? {
        return array.popLast()
    }
    
    mutating func reset() {
        array.removeAll()
    }
    
    func peek() -> T? {
        return array.last
    }
}

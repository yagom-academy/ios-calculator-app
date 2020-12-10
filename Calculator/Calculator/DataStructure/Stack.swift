//
//  Stack.swift
//  Calculator
//
//  Created by Yeon on 2020/12/07.
//

import Foundation
struct Stack<T> {
    fileprivate var elements = [T]()
    var size: Int {
        return elements.count
    }
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    init() {}
    
    func peek() -> T? {
        return self.elements.last
    }
    
    mutating func push(_ element: T) {
        self.elements.append(element)
    }
    
    mutating func pop() -> T? {
        return self.elements.popLast()
    }
    
    mutating func removeAll() {
        self.elements.removeAll()
    }
}

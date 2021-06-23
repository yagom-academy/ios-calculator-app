//
//  Stack.swift
//  Calculator
//
//  Created by JINHONG AN on 2021/06/23.
//

import Foundation

struct Stack<Element> {
    private var storage: Array<Element> = []
    var isEmpty: Bool {
        storage.isEmpty
    }
    var count: Int {
        storage.count
    }
    
    mutating func push(element: Element) {
        storage.append(element)
    }
    
    mutating func pop() -> Element? {
        storage.popLast()
    }
    
    func peek() -> Element? {
        storage.last
    }
    
    mutating func reset() {
        storage.removeAll()
    }
}

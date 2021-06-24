//
//  Stack.swift
//  Calculator
//
//  Created by 김태영 on 2021/06/22.
//

import Foundation

struct Stack<Element> {
    var items = [Element]()
    var isEmpty: Bool {
        return items.isEmpty
    }
    
    func peek() -> Element? {
        return items.last
    }
    
    mutating func push(item: Element) {
        items.append(item)
    }
    @discardableResult
    mutating func pop() -> Element? {
        return items.popLast()
    }
}

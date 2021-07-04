//
//  Stack.swift
//  Calculator
//
//  Created by 박태현 on 2021/06/25.
//

import Foundation
struct Stack<Element> {
    private var items = [Element]()
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

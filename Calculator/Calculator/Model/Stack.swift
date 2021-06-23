//
//  Stack.swift
//  Calculator
//
//  Created by 김태영 on 2021/06/22.
//

import Foundation

struct Stack<Element> {
    var items = [Element]()
    var top: Element? {
        return items.last
    }
    var isEmpty: Bool {
        return items.isEmpty
    }
    
    mutating func push(item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element? {
        return items.popLast()
    }
}

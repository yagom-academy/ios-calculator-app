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
        return items.isEmpty ? nil : items.last
    }
    
    mutating func push(item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element? {
        return items.popLast()
    }
    
//    func peek() -> Element? {
//        return items.last
//    }
    func isEmpty() -> Bool {
        return items.isEmpty
    }
}

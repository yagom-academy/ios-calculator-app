//
//  Stack.swift
//  Calculator
//
//  Created by 임성민 on 2020/12/08.
//

import Foundation

class Stack<Element> {
    private var items: [Element] = []
    
    var top: Element? {
        return items.last
    }
    
    var size: Int {
        return items.count
    }
    
    var isEmpty: Bool {
        return items.count > 0 ? true : false
    }
    
    func push(_ item: Element) {
        items.append(item)
    }
    
    func pop() -> Element? {
        items.popLast()
    }
    
    func removeAll() {
        items.removeAll()
    }
}


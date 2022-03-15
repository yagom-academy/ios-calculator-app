//
//  Queue.swift
//  Calculator
//
//  Created by 김동욱 on 2022/03/15.
//

import Foundation

struct CalculatorItemQueue<Element: CalculateItem> {
    private var addStack: [Element] = []
    private var subStack: [Element] = []
    
    var list: [Element] {
        return addStack + subStack
    }
    
    var last: Element? {
        return addStack.last
    }
    
    var first: Element? {
        return addStack.first
    }
    
    var isEmpty: Bool {
        return addStack.isEmpty && subStack.isEmpty
    }
    
    mutating func resetQueue() {
        addStack.removeAll()
        subStack.removeAll()
    }
    
    mutating func enQueue(element: Element) {
        addStack.append(element)
    }
    
    mutating func deQueue() -> Element? {
        if subStack.isEmpty {
            subStack = addStack.reversed()
            addStack.removeAll()
        }
        return subStack.popLast()
    }
}

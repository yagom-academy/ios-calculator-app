//
//  Queue.swift
//  Calculator
//
//  Created by 김동욱 on 2022/03/15.
//

import Foundation

struct CalculatorItemQueue<Element: CalculateItem> {
    var addStack: [Element] = []
    var subStack: [Element] = []
    
    var peek: Element? {
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

//
//  Queue.swift
//  Calculator
//
//  Created by 김동욱 on 2022/03/15.
//

import Foundation

struct CalculatorItemQueue<Element> {
    private var addStack: [CalculateItem] = []
    private var subStack: [CalculateItem] = []
    
    var list: [CalculateItem] {
        return addStack + subStack
    }
    
    var last: CalculateItem? {
        return addStack.last
    }
    
    var first: CalculateItem? {
        return addStack.first
    }
    
    var isEmpty: Bool {
        return addStack.isEmpty && subStack.isEmpty
    }
    
    mutating func resetQueue() {
        addStack.removeAll()
        subStack.removeAll()
    }
    
    mutating func enQueue(item: CalculateItem) {
        addStack.append(item)
    }
    
    mutating func deQueue() -> CalculateItem? {
        if subStack.isEmpty {
            subStack = addStack.reversed()
            addStack.removeAll()
        }
        return subStack.popLast()
    }
}

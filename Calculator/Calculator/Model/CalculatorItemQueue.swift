//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 이승재 on 2021/11/09.
//

import Foundation

struct CalculatorItemQueue<Element: CalculateItem> {
    var enqueueStack: [Element] = []
    var dequeueStack: [Element] = []
    
    var isEmpty: Bool {
        return enqueueStack.isEmpty && dequeueStack.isEmpty
    }
    
    mutating func enqueue(_ item: Element) {
        enqueueStack.append(item)
    }
    
    mutating func dequeue() -> Element? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        
        return dequeueStack.popLast()
    }
}

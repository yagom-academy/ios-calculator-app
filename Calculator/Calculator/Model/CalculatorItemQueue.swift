//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 전민수 on 2022/05/16.
//

import Foundation

struct CalculatorItemQueue<Element> {
    var enqueueStack: [Element] = []
    var isEmpty: Bool {
        return enqueueStack.isEmpty
    }
    
    mutating func enqueue(element: Element) -> [Element] {
        enqueueStack.append(element)
        return enqueueStack
    }
}

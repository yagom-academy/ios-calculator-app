//
//  CalcultorItemQueue.swift
//  Calculator
//
//  Created by 고은 on 2021/11/22.
//

import Foundation

struct CalculatorItemQueue<Element: CalculateItem> {
    private(set) var enQueueElements: [Element] = []
    private(set) var deQueueElements: [Element] = []
    
    init(_ enQueueElements: [Element]) {
        self.enQueueElements = enQueueElements
    }
    
    mutating func enQueueElement(_ element: Element) {
        enQueueElements.append(element)
    }
    
    mutating func deQueueFirstElement() throws -> Element {
        if enQueueElements.isEmpty && deQueueElements.isEmpty {
            throw CalculatorQueueError.emptyQueue
        }
        if deQueueElements.isEmpty {
            deQueueElements = enQueueElements.reversed()
            enQueueElements.removeAll()
        }
        return deQueueElements.removeLast()
    }
}

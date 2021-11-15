//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 박우연 on 2021/11/09.
//

import Foundation

struct CalculatorItemQueue<Element>: CalculateItem {
    private(set) var enQueueElements: [Element] = []
    private(set) var deQueueElements: [Element] = []
    
    mutating func enQueueElement(_ element: Element) {
        enQueueElements.append(element)
    }
    
    mutating func deQueueFirstElement() throws -> Element {
        if enQueueElements.isEmpty && deQueueElements.isEmpty {
            throw CalculatorError.emptyQueue
        }
        if deQueueElements.isEmpty {
            deQueueElements = enQueueElements.reversed()
            enQueueElements.removeAll()
        }
        return deQueueElements.removeLast()
    }
}

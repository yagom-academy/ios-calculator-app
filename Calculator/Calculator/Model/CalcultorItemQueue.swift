//
//  CalcultorItemQueue.swift
//  Calculator
//
//  Created by 고은 on 2021/11/22.
//

import Foundation

struct CalculatorItemQueue<Element> {
    private(set) var enQueueElements: [Element] = []
    private(set) var deQueueElements: [Element] = []
    
    mutating func enQueueElement(_ element: Element) {
        enQueueElements.append(element)
    }
}

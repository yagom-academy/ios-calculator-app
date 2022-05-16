//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 전민수 on 2022/05/16.
//

import Foundation

struct CalculatorItemQueue<Element> {
    var enqueStack: [Element] = []
    
    mutating func enque(element: Element) -> [Element] {
        enqueStack.append(element)
        return enqueStack
    }
}

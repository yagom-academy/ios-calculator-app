//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 박우연 on 2021/11/09.
//

import Foundation
import Metal

protocol CalculateItem {
    
}

struct CalculatorItemQueue<Element>: CalculateItem {
    var enQueueArray: [Element] = []
    var deQueueArray: [Element] = []
    
    mutating func enQueue(_ element: Element) {
        enQueueArray.append(element)
    }
    
    mutating func deQueue() -> Element? {
        if enQueueArray.isEmpty && deQueueArray.isEmpty {
            return nil
        }
        if deQueueArray.isEmpty {
            deQueueArray = enQueueArray.reversed()
            enQueueArray.removeAll()
        }
        return deQueueArray.removeLast()
    }
}

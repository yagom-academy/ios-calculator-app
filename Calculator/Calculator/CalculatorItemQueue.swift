//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 박우연 on 2021/11/09.
//

import Foundation

protocol CalculateItem {
    
}

struct CalculatorItemQueue<T>: CalculateItem {
    var enQueueArray: [T] = []
    var deQueueArray: [T] = []
    
    mutating func enQueue(_ element: T) {
        enQueueArray.append(element)
    }
    
    mutating func deQueue() -> T? {
        if deQueueArray.isEmpty {
            deQueueArray = enQueueArray.reversed()
            enQueueArray.removeAll()
        }
        return deQueueArray.removeLast()
    }
}

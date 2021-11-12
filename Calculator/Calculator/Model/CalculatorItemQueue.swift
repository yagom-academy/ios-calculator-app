//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 예거 on 2021/11/08.
//

import Foundation

struct CalculatorItemQueue<Element: CalculateItem> {
    
    private(set) var queueArray: [Element] = []

    mutating func enqueue(element: Element) {
        queueArray.append(element)
    }
    
    mutating func dequeue() -> Element? {
        switch queueArray.isEmpty {
        case true:
            return nil
        case false:
            return queueArray.removeFirst()
        }
    }
    
    mutating func clearQueueArray() {
        queueArray.removeAll()
    }
}

//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 예거 on 2021/11/08.
//

import Foundation

struct CalculatorItemQueue<Element: CalculateItem> {
    private(set) var queue: [Element] = []

    mutating func enqueue(element: Element) {
        queue.append(element)
    }
    
    mutating func dequeue() -> Element? {
        switch queue.isEmpty {
        case true:
            return nil
        case false:
            return queue.removeFirst()
        }
    }
    
    mutating func clearQueue() {
        queue.removeAll()
    }
}

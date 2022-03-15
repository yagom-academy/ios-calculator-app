//
//  Queue.swift
//  Calculator
//
//  Created by 김동욱 on 2022/03/15.
//

import Foundation

struct CalculatorItemQueue<Element: CalculateItem> {
    var queue: [Element] = []
    
    mutating func resetQueue() {
        queue.removeAll()
    }
    
    mutating func enQueue(element: Element) {
        queue.append(element)
    }
}



//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 임지성 on 2021/11/08.
//

import Foundation

struct CalculatorItemQueue<Element>: CalculateItem {
    private(set) var inbox = [Element]()
    
    mutating func enqueue(_ element: Element) {
        inbox.append(element)
    }
    
    mutating func dequeue() -> [Element] {
        inbox.removeFirst()
        
        return inbox
    }
}

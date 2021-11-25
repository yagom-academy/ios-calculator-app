//
//  CalculatorItem.swift
//  Calculator
//
//  Created by Seul Mac on 2021/11/09.
//

import Foundation

struct CalculatorItemQueue<Element: CalculateItem> {
    
    // MARK: private property
    
    private var linkedList = LinkedList<Element>()
    
}

// MARK: - internal method

extension CalculatorItemQueue {
    
    mutating func enqueue(_ item: Element) {
        linkedList.append(data: item)
    }
    
    mutating func dequeue() -> Element? {
        return linkedList.removeFirst()
    }
    
}


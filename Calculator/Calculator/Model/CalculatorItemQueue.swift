//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by DuDu on 2022/03/14.
//

import UIKit

struct CalculatorItemQueue<Element: CalculateItem> {
    var list = LinkedList<Element>()
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    mutating func enqueue(_ data: Element) {
        list.append(data)
    }
    
    mutating func dequeue() -> Element? {
        list.removeFirst()
    }
}



//
//  Queue.swift
//  Calculator
//
//  Created by 김동욱 on 2022/03/15.
//

import Foundation

struct CalculatorItemQueue<Element: CalculateItem> {
    private(set) var list: [Element] = []
    
    var isEmpty: Bool {
        list.isEmpty
    }
    
    mutating func resetQueue() {
        list.removeAll()
    }
    
    mutating func enQueue(element: Element) {
        list.append(element)
    }
}



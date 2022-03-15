//
//  Queue.swift
//  Calculator
//
//  Created by 김동욱 on 2022/03/15.
//

import Foundation

struct CalculatorItemQueue<Element: CalculateItem> {
    var addList: [Element] = []
    var subList: [Element] = []
    
    var peek: Element? {
        addList.first
    }
    
    var isEmpty: Bool {
        addList.isEmpty && subList.isEmpty
    }
    
    mutating func resetQueue() {
        addList.removeAll()
    }
    
    mutating func enQueue(element: Element) {
        addList.append(element)
    }
}



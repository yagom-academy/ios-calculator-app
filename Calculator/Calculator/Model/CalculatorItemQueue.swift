//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 조민호 on 2022/03/15.
//

import Foundation

protocol CalculateItem {}

extension Int: CalculateItem {}

struct CalculatorItemQueue<Element: CalculateItem> {
    private var inputStack: [Element] = []
    
    var currentInputStack: [Element] {
        return inputStack
    }
    
    mutating func enqueue(_ element: Element) {
        inputStack.append(element)
    }
}

//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by mmim.
//

import Foundation

struct CalculatorItemQueue<Element: CalculatorItem> {
    var forwordStack: [Element] = []
    var reverseStack: [Element] = []
    
    mutating func enqueue(_ element: Element) {
        forwordStack.append(element)
    }
}

protocol CalculatorItem { }

extension Double: CalculatorItem { }

enum Operator: CalculatorItem {
    case plus
    case minus
    case divide
    case multiply
}

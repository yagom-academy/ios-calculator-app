//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by mmim.
//

import Foundation

struct CalculatorItemQueue<Element: CalculatorItem> {
    var inputStack: [Element] = []
    var outputStack: [Element] = []
    
    var count: Int {
        inputStack.count + outputStack.count
    }
    
    mutating func enqueue(_ element: Element) {
        inputStack.append(element)
    }
    
    mutating func dequeue() -> Element? {
        if outputStack.isEmpty {
            guard !inputStack.isEmpty else { return nil }
            outputStack = inputStack.reversed()
            inputStack.removeAll()
        }
        return outputStack.removeLast()
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

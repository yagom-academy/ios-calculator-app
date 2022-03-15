//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by mmim.
//

import Foundation

struct CalculatorItemQueue<Element: CalculatorItem> {
    private(set) var inputStack: [Element] = []
    private(set) var outputStack: [Element] = []
    
    var count: Int {
        inputStack.count + outputStack.count
    }
    
    var first: Element? {
        outputStack.isEmpty ? inputStack.first : outputStack.last
    }
    
    mutating func enqueue(_ element: Element) {
        inputStack.append(element)
    }
    
    mutating func dequeue() -> Element? {
        if outputStack.isEmpty {
            outputStack = inputStack.reversed()
            inputStack.removeAll()
        }
        return outputStack.popLast()
    }
    
    mutating func removeAll() {
        inputStack.removeAll()
        outputStack.removeAll()
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

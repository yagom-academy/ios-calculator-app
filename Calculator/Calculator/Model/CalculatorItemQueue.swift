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
    private var outputStack: [Element] = []
    
    var currentInputStack: [Element] {
        return inputStack
    }
    
    var currentOutputStack: [Element] {
        return outputStack
    }
    
    mutating func enqueue(_ element: Element) {
        inputStack.append(element)
    }
    
    mutating func dequeue() -> Element {
        if outputStack.isEmpty {
            outputStack = inputStack.reversed()
            inputStack.removeAll()
        }
        
        return outputStack.removeLast()
    }
}

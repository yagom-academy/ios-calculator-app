//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 조민호 on 2022/03/15.
//

import Foundation

protocol CalculateItem {}

extension Double: CalculateItem {}

struct CalculatorItemQueue<Element: CalculateItem> {
    private var inputStack: [Element] = []
    private var outputStack: [Element] = []
    
    var isEmpty: Bool {
        return inputStack.isEmpty && outputStack.isEmpty
    }
    
    var count: Int {
        return inputStack.count + outputStack.count
    }
    
    var first: Element? {
        return outputStack.last ?? inputStack.first
    }
    
    var last: Element? {
        return outputStack.first ?? inputStack.last
    }
    
    mutating func enqueue(_ element: Element) {
        inputStack.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> Element? {
        guard self.isEmpty == false else {
            return nil
        }
        
        if outputStack.isEmpty {
            outputStack = inputStack.reversed()
            inputStack.removeAll()
        }
        
        return outputStack.removeLast()
    }
    
    mutating func clear() {
        inputStack.removeAll()
        outputStack.removeAll()
    }
}

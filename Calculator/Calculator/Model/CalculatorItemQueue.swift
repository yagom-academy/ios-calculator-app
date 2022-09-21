//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by SummerCat on 2022/09/20.
//

import Foundation

protocol CalculateItem {
    
}

struct CalculatorItemQueue<Item: CalculateItem> {
    var inputStack: [Item] = []
    var outputStack: [Item] = []
    var isEmpty: Bool {
        return inputStack.isEmpty && outputStack.isEmpty
    }
    
    mutating func enqueue(item: Item) {
        inputStack.append(item)
    }
    
    mutating func dequeue() -> Item? {
        if isEmpty { return nil }
        
        if outputStack.isEmpty {
            outputStack = inputStack.reversed()
            inputStack.removeAll()
        }
        
        return outputStack.removeLast()
    }
}

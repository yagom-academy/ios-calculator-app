//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by SummerCat on 2022/09/20.
//

struct CalculatorItemQueue<Item: CalculateItem> {
    private(set) var inputStack: [Item] = []
    private(set) var outputStack: [Item] = []
    var isEmpty: Bool {
        return inputStack.isEmpty && outputStack.isEmpty
    }
    
    mutating func enqueue(item: Item) {
        inputStack.append(item)
    }
    
    mutating func dequeue() -> Item? {
        guard !isEmpty else { return nil }
        
        if outputStack.isEmpty {
            outputStack = inputStack.reversed()
            inputStack.removeAll()
        }
        
        return outputStack.removeLast()
    }
}

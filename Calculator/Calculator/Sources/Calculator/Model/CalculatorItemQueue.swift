//
//  CalculatorItemQueue.swift
//  Created by 미니.
//

struct CalculatorItemQueue<Element: CalculateItem> {
    private(set) var inputStack: [Element] = []
    private(set) var outputStack: [Element] = []
    
    var isEmpty: Bool {
        return inputStack.isEmpty && outputStack.isEmpty
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
}

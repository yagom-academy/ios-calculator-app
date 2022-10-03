//
//  CalculatorItemQueue.swift
//  Created by 미니.
//

struct CalculatorItemQueue<Element: CalculateItem> {
    private var inputStack: [Element] = []
    private var outputStack: [Element] = []
    
    private(set) var isEmpty: Bool {
        return inputStack.isEmpty && outputStack.isEmpty
    }
    
    init(elements: [Element] = []) {
        self.inputStack = elements
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

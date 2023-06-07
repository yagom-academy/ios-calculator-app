//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 박종화 on 2023/05/30.
//

struct CalculatorItemQueue<Element: CalculatorItem> {
    private var outputStack: [Element] = []
    private var inputStack: [Element] = []
    
    internal var count: Int {
        let stackCount = outputStack + inputStack
        return stackCount.count
    }
    
    internal var isEmpty: Bool {
        return outputStack.isEmpty && inputStack.isEmpty
    }
    
    internal var peek: Element? {
        return outputStack.isEmpty ? outputStack.last : inputStack.first
    }
    
    internal mutating func enqueue(_ element: Element) {
        inputStack.append(element)
    }
    
    internal mutating func dequeue() -> Element? {
        if outputStack.isEmpty {
            outputStack = inputStack.reversed()
            inputStack.removeAll()
        }
        return outputStack.popLast()
    }
    
    internal mutating func clear() {
        inputStack.removeAll()
        outputStack.removeAll()
    }
}

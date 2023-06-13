//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Jusbug, Yetti on 2023/05/30.
//

struct CalculatorItemQueue<Element: CalculatorItem> {
    private var enqueueStack: [Element] = []
    private var dequeueStack: [Element] = []
    
    internal var count: Int {
        let stackCount = dequeueStack + enqueueStack
        return stackCount.count
    }
    
    internal var isEmpty: Bool {
        return dequeueStack.isEmpty && enqueueStack.isEmpty
    }
    
    internal var peek: Element? {
        return dequeueStack.isEmpty ? enqueueStack.first : dequeueStack.last
    }
    
    internal mutating func enqueue(_ element: Element) {
        enqueueStack.append(element)
    }
    
    internal mutating func dequeue() -> Element? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        return dequeueStack.popLast()
    }
    
    internal mutating func clear() {
        enqueueStack.removeAll()
        dequeueStack.removeAll()
    }
}

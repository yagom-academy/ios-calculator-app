//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Jusbug, Yetti on 2023/05/30.
//

struct CalculatorItemQueue<Element: CalculatorItem> {
    private var enqueueStack: [Element] = []
    private var dequeueStack: [Element] = []
    
    var count: Int {
        let stackCount = dequeueStack + enqueueStack
        return stackCount.count
    }
    
    var isEmpty: Bool {
        return dequeueStack.isEmpty && enqueueStack.isEmpty
    }
    
    var peek: Element? {
        return dequeueStack.isEmpty ? enqueueStack.first : dequeueStack.last
    }
    
    mutating func enqueue(_ element: Element) {
        enqueueStack.append(element)
    }
    
    mutating func dequeue() -> Element? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        return dequeueStack.popLast()
    }
    
    mutating func clear() {
        enqueueStack.removeAll()
        dequeueStack.removeAll()
    }
}

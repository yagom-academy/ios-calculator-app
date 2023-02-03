//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 천승현 on 2023/01/25.
//

struct CalculatorItemQueue<Item: CalculatorItem> {
    
    private(set) var enqueueStack: [Item] = []
    private(set) var dequeueStack: [Item] = []
    
    init(enqueueStack: [Item] = []) {
        self.enqueueStack = enqueueStack
    }
    
    var isEmpty: Bool {
        return enqueueStack.isEmpty && dequeueStack.isEmpty
    }
    
    mutating func removeAllElement() {
        enqueueStack.removeAll()
        dequeueStack.removeAll()
    }
    
    mutating func enqueue(_ element: Item) {
        enqueueStack.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> Item? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        return dequeueStack.popLast()
    }
}

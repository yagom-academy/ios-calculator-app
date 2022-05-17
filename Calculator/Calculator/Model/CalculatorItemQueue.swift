//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 김동용 on 2022/05/16.
//

struct CalculatorItemQueue<T>: Queue, CalculateItem {
    var enQueueStack: Array<T> = []
    var deQueueStack: Array<T> = []
    
    public mutating func enQueue(_ input: T) {
        enQueueStack.append(input)
    }
    
    public mutating func deQueue() throws -> T? {
        if enQueueStack.isEmpty {
            throw QueueError.empty
        }
        else {
            deQueueStack = enQueueStack.reversed()
            enQueueStack.removeAll()
        }
        return deQueueStack.popLast()
    }
    
    public mutating func clearAllStacks() {
        enQueueStack = []
        deQueueStack = []
    }
}

//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 김동용 on 2022/05/16.
//

struct CalculatorItemQueue<T>: Queue, CalculateItem {
    var enQueueStack: Array<T> = []
    var deQueueStack: Array<T> = []
    
    mutating func enQueue(_ input: T) {
        enQueueStack.append(input)
    }
    
    mutating func deQueue() throws -> T {
        if enQueueStack.isEmpty {
            throw QueueError.empty
        }
        deQueueStack = enQueueStack.reversed()
        enQueueStack.removeAll()

        guard let deQueue = deQueueStack.popLast() else { throw QueueError.empty }
        
        return deQueue
    }
    
    public mutating func clearAllStacks() {
        enQueueStack = []
        deQueueStack = []
    }
}

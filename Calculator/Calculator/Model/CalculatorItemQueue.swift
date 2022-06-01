//
//  CalculatorItemQueue.swift
//  Calculator
//  Created by hugh,bard on 2022/05/30.
//

struct CalculatorItemQueue<T>: Queue, CalculateItem {
    private(set) var enQueueStack: Array<T> = []
    private(set) var deQueueStack: Array<T> = []
    
    mutating func enQueue(_ input: T) {
        enQueueStack.append(input)
    }
    
    mutating func deQueue() throws -> T {
        if deQueueStack.isEmpty {
            deQueueStack = enQueueStack.reversed()
            enQueueStack.removeAll()
        }
        
        guard let deQueue = deQueueStack.popLast() else {
            throw QueueError.unknown
        }
        
        return deQueue
    }
}

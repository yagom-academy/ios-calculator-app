//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 김동용 on 2022/05/16.
//

struct CalculatorItemQueue<T>: Queue, CalculateItem {
    private(set) var enQueueStack: Array<T> = []
    private(set) var deQueueStack: Array<T> = []
    private(set) var joinedQueue: Array<T> = []
    
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
        
        joinedQueue = enQueueStack + deQueueStack
        return deQueue
    }
    
    public mutating func clearAllStacks() {
        enQueueStack = []
        deQueueStack = []
    }
}

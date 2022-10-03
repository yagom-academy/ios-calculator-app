//
//  CalculatorItemQueue.swift
//  Calculator
//

protocol CalculateItem {
}

struct CalculatorItemQueue<T: CalculateItem> {
    private(set) var enqueueStack: [T]
    private(set) var dequeueStack: [T] = []
    
    var mergedQueue: [T] {
        return enqueueStack + dequeueStack.reversed()
    }
    
    var isEmpty: Bool {
        return enqueueStack.isEmpty && dequeueStack.isEmpty
    }
    
    init(_ queue: [T]) {
        enqueueStack = queue
    }
    
    mutating func enqueue(_ n: T) {
        enqueueStack.append(n)
    }
    
    mutating func dequeue() -> T? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        return dequeueStack.popLast()
    }

    mutating func removeAll() {
        enqueueStack.removeAll()
        dequeueStack.removeAll()
    }
}

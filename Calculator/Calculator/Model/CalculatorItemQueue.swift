//
//  CalculatorItemQueue.swift
//  Calculator
//

protocol CalculateItem {
}

struct CalculatorItemQueue {
    var enqueue: [CalculateItem]
    var dequeue: [CalculateItem] = []
    
    var mergedQueue: [CalculateItem] {
        return enqueue + dequeue.reversed()
    }
    
    var isEmpty: Bool {
        return enqueue.isEmpty && dequeue.isEmpty
    }
    
    init(_ queue: [CalculateItem]) {
        enqueue = queue
    }
    
    mutating func pushLast(_ n: CalculateItem) {
        enqueue.append(n)
    }
    
    mutating func popFirst() -> CalculateItem? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
    }
    
    mutating func popLast() -> CalculateItem? {
        var returnValue: CalculateItem?
        if enqueue.isEmpty {
            dequeue.reverse()
            returnValue = dequeue.popLast()
            dequeue.reverse()
        } else {
            returnValue = enqueue.popLast()
        }
        return returnValue
    }

    mutating func removeAll() {
        enqueue.removeAll()
        dequeue.removeAll()
    }
}

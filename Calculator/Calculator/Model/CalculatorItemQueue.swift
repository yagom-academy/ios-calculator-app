//
//  CalculatorItemQueue.swift
//  Calculator
//

protocol CalculateItem {
}

struct CalculatorItemQueue<Item: CalculateItem> {
    var enqueue: [Item]
    var dequeue: [Item] = []
    
    var isEmpty: Bool {
        return enqueue.isEmpty && dequeue.isEmpty
    }
    
    init(_ queue: [Item]) {
        enqueue = queue
    }
    
    mutating func pushLast(_ n: Item) {
        enqueue.append(n)
    }
    
    mutating func popFirst() -> Item? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
    }
    
    mutating func popLast() -> Item? {
        var returnValue: Item?
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

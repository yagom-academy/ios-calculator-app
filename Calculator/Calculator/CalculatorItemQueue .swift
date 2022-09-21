//
//  CalculatorItemQueue .swift
//  Calculator
//
//  Created by Jeremy on 2022/09/20.
//

struct CalculatorItemQueue {
    private var elementCount: Int = 0
    private var firstElementIndex: Int = 0
    var queue: [Int: Item] = [:]
}

extension CalculatorItemQueue: QueueManager {
    
    mutating func add(item: Item) {
        self.queue[self.elementCount] = item
        elementCount += 1
    }
    
    mutating func getFirst() -> Item? {
        let firstItem = queue.removeValue(forKey: firstElementIndex)
        firstElementIndex += 1
        return firstItem
    }
    
    mutating func getLast() -> Item? {
        elementCount -= 1
        let lastItem = queue.removeValue(forKey: elementCount)
        return lastItem ?? nil
    }

    mutating func removeAll() {
        queue = [:]
        elementCount = 0
    }
}

//
//  CalculatorItemQueue .swift
//  Calculator
//
//  Created by Jeremy on 2022/09/20.
//

struct CalculatorItemQueue {
    private var elementCount: Int = 0
    private var firstElementIndex: Int = 0
    var queue:[String: [Int: Item]] = [
        "queue": [: ]
    ]
}

extension CalculatorItemQueue: QueueManager {
    mutating func add(item: Item) {
        self.queue["queue"]?[self.elementCount] = item
        elementCount += 1
    }
    
    mutating func getFirst() -> Item? {
        let firstItem = queue["queue"]?[self.firstElementIndex]
        return firstItem
    }
    
    mutating func getLast() -> Item? {
        elementCount -= 1
        let lastItem = queue["queue"]?.removeValue(forKey: elementCount)
        return lastItem ?? nil
    }

    mutating func removeAll() {
        queue["queue"] = [:]
        elementCount = 0
    }
}

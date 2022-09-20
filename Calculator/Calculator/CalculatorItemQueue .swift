//
//  CalculatorItemQueue .swift
//  Calculator
//
//  Created by Jeremy on 2022/09/20.
//

struct CalculatorItemQueue {
    private var elementCount: Int = 0
    var queue:[String: [Int: Item]] = [
        "queue": [: ]
    ]
}

extension CalculatorItemQueue: QueueManager {
    mutating func add(item: Item) {
        var myQue = queue["queue"]
        myQue?[self.elementCount] = item
        elementCount += 1
    }
    
    mutating func getFirst() -> Item? {
        return queue["queue"]?.first?.value ?? nil
    }
    
    mutating func getLast() -> Item? {
        let lastItem = queue["queue"]?.removeValue(forKey: elementCount)
        elementCount -= 1
        return lastItem ?? nil
    }

    mutating func removeAll() {
        queue["queue"] = [:]
        elementCount = 0
    }
}

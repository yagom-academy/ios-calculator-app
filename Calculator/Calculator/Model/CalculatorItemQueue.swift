//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 김태현 on 2022/03/14.
//

final class CalculatorItemQueue {
    var queue: [CalculatorItem]
    
    init(queue: [CalculatorItem] = []) {
        self.queue = queue
    }
    
    func isEmpty() -> Bool {
        return queue.isEmpty
    }
    
    func enqueue(_ newValue: CalculatorItem) {
        self.queue.append(newValue)
    }
    
    func dequeue() -> CalculatorItem {
        self.queue.removeFirst()
    }
    
    func clear() {
        self.queue = []
    }
}

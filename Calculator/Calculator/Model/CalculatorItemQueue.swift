//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 김태현 on 2022/03/14.
//

final class CalculatorItemQueue {
    var queue: [CalculatorItem]
    var front: Int
    var rear: Int
    
    init(queue: [CalculatorItem] = [], front: Int = -1, rear: Int = -1) {
        self.queue = queue
        self.front = front
        self.rear = rear
    }
    
    func isEmpty() -> Bool {
        return queue.isEmpty
    }
    
    func enqueue(_ newValue: CalculatorItem) {
        self.queue.append(newValue)
    }
}

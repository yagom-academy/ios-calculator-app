//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by leewonseok on 2022/09/19.
//

struct CalculatorItemQueue {
    private var queue: [CalculateItem?] = []
    private var headIndex: Int = 0
    
    var count: Int {
        return queue.compactMap { $0 }.count
    }
    
    var isEmpty: Bool {
        return queue.isEmpty
    }
    
    mutating func enqueue(_ element: CalculateItem) {
        queue.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> CalculateItem? {
        guard headIndex <= queue.count, let element = queue[safe: headIndex] else { return nil }
        
        queue[headIndex] = nil
        headIndex += 1
        if headIndex > (queue.count / 4) {
            queue.removeFirst(headIndex)
            headIndex = 0
        }
        return element
    }
    
    mutating func clear() {
        queue.removeAll()
    }
}

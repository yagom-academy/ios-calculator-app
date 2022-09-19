//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by leewonseok on 2022/09/19.
//

extension Double: CalculateItem {
    
}

struct CalculatorItemQueue {
    private var queue: [CalculateItem?] = []
    private var head: Int = 0
    
    var count: Int {
        return queue.filter { $0 != nil }.count
    }
    
    var isEmpty: Bool {
        return queue.isEmpty
    }
    
    mutating func enqueue(_ element: Double) {
        queue.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> CalculateItem? {
        guard queue.count != 0, head <= queue.count, let element = queue[head] else { return nil }
        
        queue[head] = nil
        head += 1
        if head > (queue.count / 4) {
            queue.removeFirst(head)
            head = 0
        }
        return element
    }
    
    mutating func clear() {
        queue.removeAll()
    }
}

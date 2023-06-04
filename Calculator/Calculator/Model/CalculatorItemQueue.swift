//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Serena on 2023/05/29.
//

struct CalculatorItemQueue<Element: CalculateItem> {
    private var queue: [Element]
    private var reversedQueue: [Element] = []
    
    var isAllQueueEmpty: Bool {
        return queue.isEmpty && reversedQueue.isEmpty
    }
     
    var peek: Element? {
        return reversedQueue.isEmpty ? queue.first : reversedQueue.last
    }
    
    init(queue: [Element] = []) {
        self.queue = queue
    }
    
    mutating func enqueue(element: Element) {
        queue.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> Element? {
        if reversedQueue.isEmpty {
            reversedQueue = queue.reversed()
            queue.removeAll()
        }
        return reversedQueue.popLast()
    }
}

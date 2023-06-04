//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Serena on 2023/05/29.
//

struct CalculatorItemQueue<Element> {
    private(set) var queue: [Element]
    private(set) var reversedQueue: [Element] = []
    
    var isEmpty: Bool {
        queue.isEmpty
    }
     
    var peek: (Element)? {
        return queue.isEmpty ? nil : queue.first
    }
    
    init(queue: [Element] = []) {
        self.queue = queue
    }
    
    mutating func enqueue(element: Element) {
        queue.append(element)
    }
    
    mutating func dequeue() -> (Element)? {
        if reversedQueue.isEmpty {
            reversedQueue = queue.reversed()
            queue.removeAll()
        }
        return reversedQueue.popLast()
    }
}

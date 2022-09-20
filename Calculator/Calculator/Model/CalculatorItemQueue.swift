//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by smfc on 19/9/2022.
//

struct CalculatorItemQueue<T>: CalculateItem {
    var queue: [T?] = []
    var head: Int = 0
    
    mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    mutating func count() -> Int {
        return queue.count - head
    }
    
    func isEmpty() -> Bool {
        return queue.isEmpty
    }
    
    mutating func clear() {
        queue.removeAll()
    }
    
    mutating func dequeue() -> T? {
        guard head < queue.count, let element = queue[head] else {
            return nil
        }
        queue[head] = nil
        head += 1
        
        if head > (queue.count / 4) {
            queue.removeFirst(head)
            head = 0
        }
        return element
    }
    
    func peek() -> T? {
        guard queue.count != head else {
            return nil
        }
        return queue[head]
    }
}

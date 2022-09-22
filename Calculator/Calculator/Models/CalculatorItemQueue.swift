//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Kyo on 2022/09/19.
//

final class CalculatorItemQueue<T: CalculateItem> {
    private var queue: LinkedList<T>! = LinkedList()
    
    func first() -> T? {
        return queue.bringHead()
    }
    
    func last() -> T? {
        return queue.bringTail()
    }
    
    func enqueue(_ data: T) {
        queue.append(data: data)
    }
    
    func dequeue() -> T? {
        return queue.removeFirst()
    }
    
    func count() -> Int {
        return queue.bringListCount()
    }
    
    func removeAll() {
        queue.removeAll()
    }
}

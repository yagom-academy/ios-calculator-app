//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 혜모리 on 2023/01/24.
//

struct CalculatorItemQueue<T: CalculateItem> {
    private(set) var queue: LinkedList<T> = LinkedList<T>()
    
    func enqueue(_ data: T) {
        queue.appendLast(data)
    }
    
    func removeRear() -> Node<T>? {
        return queue.removeLast()
    }
    
    func dequeue() -> Node<T>? {
        return queue.removeFirst()
    }
    
    func removeAll() {
        queue.removeAll()
    }
}

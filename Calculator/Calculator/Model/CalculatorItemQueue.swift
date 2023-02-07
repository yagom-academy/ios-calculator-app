//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 혜모리, 릴라 on 2023/01/24.
//

struct CalculatorItemQueue<T: CalculateItem> {
    private(set) var queue: LinkedList<T> = LinkedList<T>()
    
    func enqueue(_ data: T) {
        queue.appendLast(data)
    }
    
    @discardableResult
    func dequeue() -> Node<T>? {
        return queue.removeFirst()
    }
    
    func removeAll() {
        queue.removeAll()
    }
}

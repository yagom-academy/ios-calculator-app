//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by junho lee on 2022/09/20.
//

class CalculatorItemQueue<T>: CalculateItem {
    private var queue: Array<T> = []
    
    func enqueue(_ element: T) {
        queue.append(element)
    }
    
    func dequeue() -> T? {
        return queue.isEmpty ? nil : queue.removeFirst()
    }
}

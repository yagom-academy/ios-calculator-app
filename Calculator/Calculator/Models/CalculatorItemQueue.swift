//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 노유빈 on 2022/09/19.
//

class CalculatorItemQueue<T>: CalculateItem {
    private var enqueue: [T] = []
    private var dequeue: [T] = []
    private var isEmpty: Bool {
        return enqueue.isEmpty && dequeue.isEmpty
    }
    
    private func push(_ element: T) {
        enqueue.append(element)
    }
    
    private func pop() -> T? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        
        return dequeue.popLast()
    }
}

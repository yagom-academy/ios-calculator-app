//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 노유빈 on 2022/09/19.
//

class CalculatorItemQueue<T>: CalculateItem {
    private var enqueue: [T] = []
    private var dequeue: [T] = []
    var isEmpty: Bool {
        return enqueue.isEmpty && dequeue.isEmpty
    }
    
    func push(_ element: T) {
        enqueue.append(element)
    }
    
    func pop() -> T? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        
        return dequeue.popLast()
    }
}

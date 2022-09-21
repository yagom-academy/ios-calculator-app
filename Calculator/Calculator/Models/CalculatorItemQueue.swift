//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 노유빈 on 2022/09/19.
//

class CalculatorItemQueue {
    private var enqueue: [CalculateItem] = []
    private var dequeue: [CalculateItem] = []
    
    var isEmpty: Bool {
        return enqueue.isEmpty && dequeue.isEmpty
    }
    
    var count: Int {
        return enqueue.count + dequeue.count
    }
    
    func push(_ element: CalculateItem) {
        enqueue.append(element)
    }
    
    func pop() -> CalculateItem? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        
        return dequeue.popLast()
    }
}

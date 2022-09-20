//  CalculatorItemQueue.swift
//  Created by zhilly on 2022/09/20.

struct CalculatorItemQueue<T> {
    private var queue: [T] = []
    
    var count: Int {
        return queue.count
    }
    
    var isEmpty: Bool {
        return queue.isEmpty ? true : false
    }
    
    mutating func push(_ element: T) {
        queue.append(element)
    }
    
    mutating func pop() -> T? {
        return isEmpty ? nil : queue.removeFirst()
    }
}

extension CalculatorItemQueue: CalculateItem {
    
}

//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by SeoDongyeon on 2022/03/15.
//

import Foundation

struct CalculatorItemQueue<T> {
    private var list = CalculatorLinkedList<T>()
    
    var count: Int {
        return list.count
    }
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    func enqueue(_ element: T) {
        list.append(element)
    }
    
    func dequeue() -> T? {
        guard !list.isEmpty else { return nil }
        return list.removeFirst()
    }
    
    func removeAll() {
        list.removeAll()
    }
}

extension CalculatorItemQueue: CalculateItem {
    
}

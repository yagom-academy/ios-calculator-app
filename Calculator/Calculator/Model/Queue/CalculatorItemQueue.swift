//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by SeoDongyeon on 2022/03/15.
//

import Foundation

struct CalculatorItemQueue<T: CalculateItem> {
    private var linkedList = CalculatorLinkedList<T>()
    
    var count: Int {
        return linkedList.count
    }
    
    var isEmpty: Bool {
        return linkedList.isEmpty
    }
    
    func enqueue(_ element: T) {
        linkedList.append(element)
    }
    
    func dequeue() -> T? {
        guard !linkedList.isEmpty else { return nil }
        return linkedList.removeFirst()
    }
    
    func removeAll() {
        linkedList.removeAll()
    }
}

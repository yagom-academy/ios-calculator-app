//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Eunsoo KIM on 2021/11/09.
//

import Foundation

struct CalculatorItemQueue<T: CalculateItem> {
    let linkedList = LinkedList<T>()
    
    func enqueue(_ value: T) {
        linkedList.append(value)
    }
    
    func dequeue() -> T? {
        let node = linkedList.removeFirst()
        
        return node?.value
    }
    
    func resetQueue() {
        linkedList.removeAll()
    }
}

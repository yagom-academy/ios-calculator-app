//
//  CalculatorQueue.swift
//  Calculator
//
//  Created by 김동욱 on 2022/03/28.
//

import Foundation

struct CalculatorQueue<T: CalculateItem> {
    private let linkedList = CalculatorLinkedList<T>()
    
    var isEmpty: Bool {
        return linkedList.isEmpty
    }
    
    func enqueue(_ element: T) {
        return linkedList.append(element)
    }
    
    func dequeue() -> T? {
        return linkedList.removeFirst()
    }
    
    func allClear() {
        return linkedList.removeAll()
    }
}

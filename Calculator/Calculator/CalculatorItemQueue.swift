//
//  QueueLinkedList.swift
//  Calculator
//
//  Created by Eddy on 2022/03/16.
//

import Foundation

struct CalculatorItemQueue<T>: CalculateItem {
    private var calculateList = CalculatorDoublyLinkedList<T>()
    
    func enqueue(_ element: T) {
        calculateList.appendNodes(element)
    }
    
    func dequeue() -> T? {
        guard !calculateList.isEmpty, let element = calculateList.firstNode else {
            return nil
        }
        return calculateList.removeNode(element)
    }
    
    var isEmpty: Bool {
        return calculateList.isEmpty
    }
    
    func resetAll() {
        return calculateList.resetAll()
    }
    
    var countNode: Int {
        return calculateList.countNodes
    }
}

//
//  QueueLinkedList.swift
//  Calculator
//
//  Created by Tiana, Eddy and Red on 2022/03/16.
//

import Foundation

struct CalculatorItemQueue<T: CalculateItem> {
    private var calculateList = CalculatorDoublyLinkedList<T>()
    
    var isEmpty: Bool {
        return calculateList.isEmpty
    }
    
    var countNode: Int {
        return calculateList.countNodes
    }
    
    func enqueue(_ element: T) {
        calculateList.appendNodes(element)
    }
    
    func dequeue() -> T? {
        if calculateList.isEmpty {
            return nil
        } else {
            return calculateList.removeNode()
        }
    }

    func resetAll() {
        return calculateList.resetAll()
    }
}

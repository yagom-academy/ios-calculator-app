//
//  QueueLinkedList.swift
//  Calculator
//
//  Created by Eddy on 2022/03/16.
//

import Foundation

struct CalculatorItemQueue: CalculateItem {
    private var calculateList = CalculatorDoublyLinkedList()
    
    func enqueue(_ element: String) {
        calculateList.appendNodes(element)
    }
    
    func dequeue(_ element: Node) -> String? {
        guard !calculateList.isEmpty else {
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

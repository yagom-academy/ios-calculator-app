//
//  QueueLinkedList.swift
//  Calculator
//
//  Created by Eddy on 2022/03/16.
//

import Foundation

public struct CalculatorItemQueue<T>: CalculateItem {
    var calculateList = CalculatorDoublyLinkedList<T>()
    
    public func enqueue(_ element: T) {
        calculateList.appendNodes(element)
    }
    
    public func dequeue() -> T? {
        guard !calculateList.isEmpty, let element = calculateList.firstNode else {
            return nil
        }
        return calculateList.removeNode(element)
    }
    
    public var isEmpty: Bool {
        return calculateList.isEmpty
    }
    
    public func resetAll() {
        return calculateList.resetAll()
    }
    
    public var countNode: Int {
        return calculateList.countNodes
    }
}

//
//  QueueLinkedList.swift
//  Calculator
//
//  Created by Eddy on 2022/03/16.
//

import Foundation

public struct QueueLinkedList<T> {
    var calculateList = CalculatorDoublyLinkedList<T>()
    
    public init() { }
    
    private func enqueue(_ element: T) {
        calculateList.append(element)
    }
    
    private func dequeue() -> T? {
        guard !calculateList.isEmpty, let element = calculateList.firstNode else {
            return nil
        }
        return calculateList.remove(element)
    }
    
    private var isEmpty: Bool {
        return calculateList.isEmpty
    }
    
    private func resetAll() {
        return calculateList.resetAll()
    }
    
    private func countNode() -> Int {
        return calculateList.countNodes
    }
}

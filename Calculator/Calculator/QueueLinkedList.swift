//
//  QueueLinkedList.swift
//  Calculator
//
//  Created by Eddy on 2022/03/16.
//

import Foundation

public struct QueueLinkedList<T> {
    var list = CalculatorDoublyLinkedList<T>()
    
    public func enqueue(_ element: T) {
        list.append(element)
    }
    
    public func dequeue() -> T? {
        guard !list.isEmpty, let element = list.first else {
            return nil
        }
        return list.remove(element)
    }
    
    public var isEmpty: Bool {
        return list.isEmpty
    }
    
    public func resetAll() {
        return list.resetAll()
    }
}

//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Derrick kim on 2022/05/17.
//

import Foundation

struct CalculatorItemQueue<T> {
    private let doublyLinkedList = DoublyLinkedList<T>()
    init() {}
}

extension CalculatorItemQueue: CalculateItemProtocol {
    var peek: T? {
        return doublyLinkedList.first?.value
    }
    
    var isEmpty: Bool {
        return doublyLinkedList.isEmpty
    }
    
    mutating func enQueue(_ element: T) -> Bool {
        doublyLinkedList.append(element)
        return true
    }
    
    mutating func deQueue() throws -> T {
        guard !doublyLinkedList.isEmpty,
              let element = doublyLinkedList.first else {
            throw QueueError.emptyData
        }
        return doublyLinkedList.remove(element)
    }
    
    mutating func removeAll() throws {
        guard !doublyLinkedList.isEmpty else {
            throw QueueError.emptyData
        }
        doublyLinkedList.removeAll()
    }
}


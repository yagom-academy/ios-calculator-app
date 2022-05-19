//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Derrick kim on 2022/05/17.
//

import Foundation

final class CalculatorItemQueue<T> {
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
    
    func enqueue(_ element: T) -> Bool {
        doublyLinkedList.append(element)
        return true
    }
    
    func dequeue() throws -> T {
        guard !doublyLinkedList.isEmpty,
              let element = doublyLinkedList.first else {
            throw QueueError.emptyData
        }
        return doublyLinkedList.remove(element)
    }
    
    func removeAll() throws {
        guard !doublyLinkedList.isEmpty else {
            throw QueueError.emptyData
        }
        doublyLinkedList.removeAll()
    }
}


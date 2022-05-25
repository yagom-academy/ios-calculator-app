//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Derrick kim on 2022/05/17.
//

import Foundation

final class CalculatorItemQueue<T: Equatable> {
    private let doublyLinkedList = DoublyLinkedList<T>()
}

extension CalculatorItemQueue {
    var peekFirst: T? {
        return doublyLinkedList.first?.value
    }
    
    var peekLast: T? {
        return doublyLinkedList.last?.value
    }
    
    var isEmpty: Bool {
        return doublyLinkedList.isEmpty
    }
    
    @discardableResult
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


extension CalculatorItemQueue {
    subscript (index: Int) -> T? {
         return doublyLinkedList[index]
     }
}

extension CalculatorItemQueue: CustomStringConvertible {
    public var description: String {
        var string = ""
        var current = doublyLinkedList.first
        while let node = current {
            string.append("\(node.value) -> ")
            current = node.next
        }
        return string + "end"
    }
}

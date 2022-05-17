//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Derrick kim on 2022/05/17.
//

import Foundation

final class CalculatorItemQueue<T> {
    private var doublyLinkedList = DoublyLinkedList<T>()
    init() {}
}

//MARK: - Queue protocol

extension CalculatorItemQueue: CalculateItemProtocol {
    var peek: T? {
        return doublyLinkedList.first?.value
    }
    
    var isEmpty: Bool {
        return doublyLinkedList.isEmpty
    }
    
    func enQueue(_ element: T) -> Bool {
        doublyLinkedList.append(element)
        return true
    }
    
    func deQueue() -> T? {
        guard !doublyLinkedList.isEmpty,
              let element = doublyLinkedList.first else {
            return nil
        }
        return doublyLinkedList.remove(element)
    }
    
    func removeAll() {
        guard !doublyLinkedList.isEmpty else {
            return
        }
        doublyLinkedList.removeAll()
    }
}


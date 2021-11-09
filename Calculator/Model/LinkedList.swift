//
//  LinkedList.swift
//  Calculator
//
//  Created by 황제하 on 2021/11/09.
//

import Foundation

class LinkedList<T> {
    var front: Node<T>?
    var rear: Node<T>?
    
    var isEmpty: Bool {
        return front == nil
    }
    
    private func addFront(_ value: T) {
        front = Node.init(value: value, next: front)
        
        if rear == nil {
            rear = front
        }
    }
    
    func addRear(value: T) {
        guard !isEmpty else {
            addFront(value)
            return
        }
        
        rear?.next = Node.init(value: value)
        
        rear = rear?.next
    }
    
    @discardableResult
    func removeFront() -> Node<T>? {
        guard front != nil else {
            return nil
        }
        
        let tempNode = front
        front = front?.next
        
        if isEmpty {
            rear = nil
        }
        
        return tempNode
    }
}

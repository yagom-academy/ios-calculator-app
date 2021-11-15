//
//  LinkedList.swift
//  Calculator
//
//  Created by 황제하 on 2021/11/09.
//

import Foundation

class LinkedList<T> {
    private(set) var front: Node<T>?
    private(set) var rear: Node<T>?
    
    var isEmpty: Bool {
        return front == nil
    }
    
    private func addFront(_ value: T) {
        front = Node(value: value, next: front)
        
        if rear == nil {
            rear = front
        }
    }
    
    func addRear(_ value: T) {
        guard !isEmpty else {
            addFront(value)
            return
        }
        
        rear?.next = Node(value: value)
        
        rear = rear?.next
    }
    
    @discardableResult
    func removeFront() -> Node<T>? {
        guard front != nil else {
            return nil
        }
        
        let resultNode = front
        front = front?.next
        
        if isEmpty {
            rear = nil
        }
        
        return resultNode
    }
    
    func removeAll() {
        front = nil
        rear = nil
    }
}

//
//  LinkedList.swift
//  Calculator
//
//  Created by 황제하 on 2021/11/09.
//

import Foundation

class LinkedList {
    var front: Node?
    var rear: Node?
    
    var isEmpty: Bool {
        return front == nil
    }
    
    func addFront(_ value: Int) {
        front = Node.init(value: value, next: front)
        
        if rear == nil {
            rear = front
        }
    }
    
    func addRear(value: Int) {
        guard !isEmpty else {
            addFront(value)
            return
        }
        
        rear?.next = Node.init(value: value)
        
        rear = rear?.next
    }
    
    func removeFront() -> Node? {
        let tempFront = self.front
        
        self.front = self.front?.next
        self.front?.next = nil
        
        return tempFront
    }
}

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
    
    func add(value: Int) {
        let node = Node(value: value)
        
        if self.front == nil {
            front = node
            rear = node
        }
        
        self.rear?.nextNode = node
        self.rear = node
    }
}

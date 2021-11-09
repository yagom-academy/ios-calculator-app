//
//  LinkedList.swift
//  Calculator
//
//  Created by 황제하 on 2021/11/09.
//

import Foundation

class LinkedList {
    var front: Node?
    
    func addFront(value: Int) {
        let node = Node(value: value)
        
        self.front = node
    }
}

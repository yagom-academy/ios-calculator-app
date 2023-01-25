//
//  LinkedList.swift
//  Calculator
//
//  Created by Rowan on 2023/01/25.
//

import Foundation

class Node<T> {
    var data: T
    var next: Node?
    
    init(data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    var count: Int = 0
    var isEmpty: Bool { self.count == 0 }
    
    
}

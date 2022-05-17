//
//  Node.swift
//  Calculator
//
//  Created by NAMU on 2022/05/17.
//

class Node<T> {
    var data: T?
    var next: Node?
    
    init(data: T?, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}


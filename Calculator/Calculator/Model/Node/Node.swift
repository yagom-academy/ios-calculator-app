//
//  Node.swift
//  Calculator
//
//  Created by 허건 on 2022/05/18.
//

class Node<T> {
    var data: T?
    var next: Node<T>?
    
    init(data: T?, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

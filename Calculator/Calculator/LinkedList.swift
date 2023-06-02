//
//  LinkedList.swift
//  Calculator
//
//  Created by Whales on 2023/06/03.
//

class Node<T> {
    var data: T?
    var next: Node?
    
    init(data: T? = nil, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

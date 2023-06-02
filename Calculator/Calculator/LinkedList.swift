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

class LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    var count: Int = 0
    
    var isEmpty: Bool {
        head == nil
    }
    
    func append(data: T?) {
    }
}

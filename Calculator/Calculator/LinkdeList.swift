//
//  LinkdeList.swift
//  Calculator
//
//  Created by 이시원 on 2022/03/15.
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

class LinkdeList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    func append(data: T) {
        if head == nil {
            head = Node(data: data)
            tail = head
            return
        }
        
        let node = Node(data: data)
        tail?.next = node
        tail = node
        
    }

}

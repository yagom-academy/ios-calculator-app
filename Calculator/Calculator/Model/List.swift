//
//  List.swift
//  Calculator
//
//  Created by 이승재 on 2021/11/09.
//

import Foundation

class Node<T> {
    var data: T?
    var next: Node?
    
    init(data: T?, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    init() {}
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func append(_ data: T?) {
        if isEmpty {
            head = Node(data: data)
            tail = head
            return
        }
        
        tail?.next = Node(data: data)
        tail = tail?.next
    }
    
    @discardableResult
    mutating func pop() -> T? {
        if isEmpty {
            return nil
        }
        head = head?.next
        if isEmpty {
            tail = nil
        }
        return head?.data
    }
    

}


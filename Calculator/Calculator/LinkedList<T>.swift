//
//  LinkedList<T>.swift
//  Calculator
//
//  Created by unchain123 on 2022/05/18.
//

import Foundation

class LinkedList<T> {
    var head: Node<T>?
    
    var count: Int {
        guard var node = head else {
            return 0
        }
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
    
    func append(data: T?) {
        let newNode = Node(data: data)
        
        guard let node = head else {
            head = newNode
            return
        }
        node.next = newNode
    }
    
    func remove() {
        if head == nil {
            return
        }
        head = head?.next
    }
    func removeAll() {
        while head != nil {
            head = head?.next
        }
    }
}

//
//  LinkedList.swift
//  Calculator
//
//  Created by 이예은 on 2022/05/17.
//

import Foundation

class LinkedList<T: CalculateItem> {
    var head: Node<T>?
    var count: Int = 0
    
    func isEmpty() -> Bool {
        if head != nil {
            return false
        }
        return true
    }
    
    func append(data: T) {
        if head == nil {
            head = Node(data)
            count += 1
            return
        }
        
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        node?.next = Node(data)
        count += 1
    }
    
    func removeFirst() -> T? {
        if head == nil {
            return nil
        }
        
        let removedNode = head
        head = head?.next
        count -= 1
        
        return removedNode?.data
    }
    
    func removeAll() {
        head = nil
        count = 0
    }
}

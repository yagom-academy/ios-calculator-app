//
//  LinkedList.swift
//  Calculator
//
//  Created by yeton on 2022/05/17.
//

import Foundation

class LinkedList<T: CalculateItem> {
    private(set) var head: Node<T>?
    var count: Int {
        calculateCount()
    }
    
    func calculateCount() -> Int {
        if head == nil {
            return 0
        }
        
        var node = head
        var count = 1
        while node?.next != nil {
            count += 1
            node = node?.next
        }
        return count
    }
    
    func isEmpty() -> Bool {
        if head != nil {
            return false
        }
        return true
    }
    
    func append(data: T) {
        if head == nil {
            head = Node(data)
            return
        }
        
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        node?.next = Node(data)
    }
    
    func removeFirst() -> T? {
        if head == nil {
            return nil
        }
        
        let removedNode = head
        head = head?.next
        
        return removedNode?.data
    }
    
    func removeAll() {
        head = nil
    }
}

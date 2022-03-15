//
//  LinkdeList.swift
//  Calculator
//
//  Created by 이시원 on 2022/03/15.
//

import Foundation

class Node<CalculateItem> {
    var data: CalculateItem
    var next: Node?
    
    init(data: CalculateItem, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

class LinkdeList<CalculateItem> {
    private var head: Node<CalculateItem>?
    private var tail: Node<CalculateItem>?
    
    func append(_ data: CalculateItem) {
        if head == nil {
            head = Node(data: data)
            tail = head
            return
        }
        
        let node = Node(data: data)
        tail?.next = node
        tail = node
        
    }
    
    func isEmpty() -> Bool {
        if head == nil {
            return true
        } else {
            return false
        }
    }
    
    func count() -> Int {
        if head == nil {
            return 0
        }
        var count = 1
        while head?.next != nil {
            count += 1
            head = head?.next
        }
        return count
    }
    
    func removeFirst() -> CalculateItem? {
        let value: CalculateItem?
        if head == nil { return nil }
        
        if head?.next == nil {
            value = head?.data
            head = nil
            tail = nil
            return value
        }
        value = head?.data
        head = head?.next
        return value
    }
    
    func removeAll() {
        if head == nil { return }
        
        head = nil
        tail = nil
    }

}

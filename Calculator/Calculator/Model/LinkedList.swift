//
//  LinkedList.swift
//  Calculator
//
//  Created by 이호영 on 2021/11/09.
//

import Foundation

class Node {
    var data: CalculateItem?
    var next: Node?
    
    init(data: CalculateItem?, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

struct LinkedList {
    private var head: Node?
    
    mutating func append(data: CalculateItem?) {
        if head == nil {
            self.head = Node(data: data)
            return
        }
        
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        node?.next = Node(data: data)
    }
    
    mutating func removeFrist() -> CalculateItem? {
        if head == nil {
            return nil
        }
        
        var removedData: CalculateItem? = nil
        
        if head?.next == nil {
            removedData = head?.data
            self.head = head?.next
        }
        return removedData
    }
    
    mutating func clear() {
        self.head = nil
    }
    
    var isEmpty: Bool {
        return head == nil ? true : false 
    }
}

extension LinkedList {
    var headForTest: Node? {
        return self.head
    }
}

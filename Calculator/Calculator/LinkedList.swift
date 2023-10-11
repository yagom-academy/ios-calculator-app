//
//  LinkedList.swift
//  Calculator
//
//  Created by Hisop on 2023/10/10.
//

struct LinkedList<T> {
    final private class Node {
       var value: T
       var next: Node?
       
       init (value: T) {
           self.value = value
       }
    }
    
    private var head: Node?
    private var tail: Node?
    private var count = 0
    
    var headValue: T? {
        return head?.value
    }
    
    var checkEmpty: Bool {
        return head == nil
    }
    
    var itemCount: Int {
        return count
    }
    
    mutating func appendNode(value: T) {
        let newNode = Node(value: value)
        if head == nil {
            head = newNode
            tail = newNode
        } else {
            tail?.next = newNode
            tail = newNode
        }
        count += 1
    }
    
    mutating func removeFirstNode() -> T? {
        guard let headNode = head else {
            return nil
        }
        
        head = headNode.next
        if head == nil {
            tail = nil
        }
        count -= 1
        return headNode.value
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
}

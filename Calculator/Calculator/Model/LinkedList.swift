//
//  LinkedList.swift
//  Calculator
//
//  Created by 이차민 on 2021/11/09.
//

import Foundation

class LinkedList<Element> {
    class ListNode<Element> {
        var value: Element
        var next: ListNode?
        
        init(value: Element) {
            self.value = value
        }
    }
    
    typealias Node = ListNode<Element>
    
    private var head: Node?
    private var tail: Node?
    
    var first: Node? {
        return head
    }
    
    var last: Node? {
        return tail
    }
    
    var isEmpty: Bool {
        return head == nil 
    }
    
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
    
    func appendNode(value: Element) {
        let newNode = Node(value: value)
        
        if let tailNode = tail {
            tailNode.next = newNode
        } else {
            head = newNode
        }
        
        tail = newNode
    }
    
    @discardableResult
    func removeFirstNode() -> Node? {
        if head == nil {
            return nil
        } else {
            let firstNode = head
            head = head?.next
            return firstNode
        }
    }
    
    func removeAllNodes() {
        head = nil
        tail = nil
    }
}

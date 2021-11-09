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
    
    var head: Node?
    
    var first: Node? {
        return head
    }
    
    var last: Node? {
        guard var node = head else {
            return nil
        }
        
        while let next = node.next {
            node = next
        }
        
        return node
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
    
    func appendNewNode(value: Element) {
        let newNode = Node(value: value)
        
        guard let lastNode = last else {
            head = newNode
            return
        }
        
        lastNode.next = newNode
    }
    
    @discardableResult
    func removeFirstNode() -> Node? {
        if head == nil {
            return nil
        } else {
            let firstElement = head
            head = head?.next
            return firstElement
        }
    }
}

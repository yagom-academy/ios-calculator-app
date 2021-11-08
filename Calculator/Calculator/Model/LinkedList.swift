//
//  LinkedList.swift
//  Calculator
//
//  Created by 이아리 on 2021/11/08.
//

import Foundation
import Metal

final class LinkedList<Element> {
    final class Node<Element> {
        var value: Element
        var next: Node<Element>?
        var prev: Node<Element>?
        
        init(value: Element) {
            self.value = value
        }
    }

    var head: Node<Element>?
    
    var first: Node<Element>? {
        return head
    }
    
    var last: Node<Element>? {
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
    
    func append(_ value: Element) {
        let newNode = Node(value: value)
        if let lastNode = last {
            newNode.prev = last
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }
    
    func node(at index: Int) -> Node<Element> {
        if index == 0 {
            return head!
        } else {
            var node = head!.next
            for _ in 1..<index {
                node = node?.next
                if node == nil { break }
            }
            return node!
        }
    }
    
    func remove(node: Node<Element>) -> Element {
        let prev = node.prev
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        next?.prev = prev
        
        node.prev = nil
        node.next = nil
        
        return node.value
    }
    
    func remove(at index: Int) -> Element {
        let node = self.node(at: index)
        return remove(node: node)
    }
    
    @discardableResult
    func removeFirst() -> Element? {
        if isEmpty { return nil }
        return remove(at: 0)
    }
    
    func removeAll() {
        head = nil
    }
}

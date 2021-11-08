//
//  LinkedList.swift
//  Calculator
//
//  Created by 이아리 on 2021/11/08.
//

import Foundation

final class LinkedList<T> {
    final class Node<T> {
        var value: T
        var next: Node?
        var prev: Node?
        
        init(value: T) {
            self.value = value
        }
    }
    var head: Node<T>?
    
    var first: Node<T>? {
        return head
    }
    
    var last: Node<T>? {
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
    
    func append(_ value: T) {
        let newNode = Node(value: value)
        if let lastNode = last {
            newNode.prev = last
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }
    
    func node(at index: Int) -> Node<T> {
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
    
    func remove(node: Node<T>) -> T {
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
    
    func remove(at index: Int) -> T {
        let node = self.node(at: index)
        return remove(node: node)
    }
    
    @discardableResult func removeLast() -> T {
        assert(!isEmpty)
        return remove(node: last!)
    }
    
    func removeAll() {
        head = nil
    }
}

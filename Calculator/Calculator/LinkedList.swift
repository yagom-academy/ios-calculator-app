//
//  LinkedList.swift
//  Calculator
//
//  Created by LIMGAUI on 2022/03/15.
//

import Foundation

final class LinkedList {
    var head: Node?
    var tail: Node?
    
    init(head: Node? = nil) {
        self.head = head
        self.tail = head
    }
    
    var count: Int {
        guard var node = self.head else {
            return 0
        }
        var count = 1
        while node.next != nil {
            count += 1
            node = node.next!
        }
        return count
    }
    
    func findNode(at index: Int) -> Node? {
        guard var node = self.head else {
            return nil
        }
        for _ in 1...index {
            guard let nextNode = node.next else {
                return nil
            }
            node = nextNode
        }
        return node
    }
    
    func append(_ newNode: Node) {
        if let tail = self.tail {
            tail.next = newNode
            self.tail = tail.next
        } else {
            self.head = newNode
            self.tail = newNode
        }
    }
    
    func insert(_ newNode: Node, at index: Int) {
        if self.head == nil {
            self.head = newNode
            self.tail = newNode
            return
        }
        guard let frontNode = findNode(at: index-1) else {
            self.tail?.next = newNode
            self.tail = newNode
            return
        }
        guard let nextNode = frontNode.next else {
            frontNode.next = newNode
            self.tail = newNode
            return
        }
        newNode.next = nextNode
        frontNode.next = newNode
    }
    
    func remove(at index: Int) {
        guard let frontNode = findNode(at: index-1) else  {
            return
        }
        guard let removeNode = frontNode.next else {
            return
        }
        guard let nextNode = removeNode.next else {
            frontNode.next = nil
            self.tail = frontNode
            return
        }
        frontNode.next = nextNode
    }
}

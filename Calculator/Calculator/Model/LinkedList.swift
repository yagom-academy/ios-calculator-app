//
//  LinkedList.swift
//  Calculator
//
//  Created by Jun Bang on 2021/11/09.
//
import Foundation

class Node<T> {
    var item: T
    var next: Node?
    var previous: Node?
    
    init(item: T) {
        self.item = item
    }
}

struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    var first: T? {
        guard let head = head else {
            return nil
        }
        return head.item
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var isNotEmpty: Bool {
        return head != nil
    }
    
    mutating func append(_ item: T) {
        let newNode = Node(item: item)
        if let tailNode = tail {
            newNode.previous = tailNode
            tailNode.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }
    
    mutating func retrieveHeadValue() -> T? {
        if let removedHead = removeHead(){
            return removedHead.item
        }
        return nil
    }
    
    mutating func removeHead() -> Node<T>? {
        guard isNotEmpty, let oldHead = head else {
            return nil
        }
        guard let newHead = oldHead.next else {
            head = nil
            return oldHead
        }
        head = newHead
        return oldHead
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
    
    mutating func remove(node: Node<T>) -> Node<T> {
        let previousNode = node.previous
        let nextNode = node.next
        
        if let previousNode = previousNode {
            previousNode.next = nextNode
        } else {
            head = nextNode
        }
        
        if let nextNode = nextNode {
            nextNode.previous = previousNode
        } else {
            tail = previousNode
        }
        node.previous = nil
        node.next = nil

        return node
    }
    
    func getNode(at index: Int) -> Node<T>? {
        guard isNotEmpty else {
            return nil
        }
        var currentNode = head
        for _ in 0..<index {
            if let node = currentNode {
                currentNode = node.next
            }
        }
        return currentNode
    }
}

//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by EUNJI CHOI on 2/5/24.
//

import Foundation

struct CalculatorItemQueue<Element>: CalculateItem where Element: Equatable {
    class Node {
        var value: Element
        var next: Node?
        
        init(value: Element) {
            self.value = value
        }
        
        deinit {
            print(value, #function)
        }
    }
    
    var head: Node?
    var tail: Node?
    
    var count: Int {
        guard head != nil else { return 0 }
        
        var cnt = 0
        var current = head
        
        repeat {
            cnt += 1
            current = current?.next
        } while current != nil
        
        return cnt
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func enqueue(_ element: Element) {
        let newNode = Node(value: element)
        
        if tail != nil {
            tail?.next = newNode
        } else {
            head = newNode
        }
        
        tail = newNode
    }
    
    mutating func dequeue() -> Element? {
        guard let headNode = head else { return nil }
        head = headNode.next
        
        if head == nil {
            tail = nil
        }
        
        return headNode.value
    }
    
    mutating func prepend(_ element: Element) {
        let newNode = Node(value: element)
        newNode.next = head
        head = newNode
    }
    
    mutating func insert(_ element: Element, before node: Node) {
        let newNode = Node(value: element)
        
        if node === head {
            prepend(element)
        } else {
            var prev: Node? = nil
            var current = head
            
            while current !== node {
                prev = current
                current = current?.next
            }
            
            newNode.next = prev?.next
            prev?.next = newNode
        }
    }
    
    func first(matching value: Element) -> Node? {
        var current = head
        
        while let node = current {
            if node.value == value {
                return node
            }
            current = current?.next
        }
        
        return nil
    }
    
    mutating func remove(node: Node) {
        var prevNode = head
        
        if prevNode === node {
            head = node.next
        } else {
            while let next = prevNode?.next {
                if next === node {
                    prevNode?.next = node.next
                    return
                }
                
                prevNode = next
            }
        }
    }
    
    mutating func removeAll() {
        head = nil
    }
    
    func printNode() {
        var currentNode = head
        
        while let node = currentNode {
            print(node.value, terminator: " -> ")
            currentNode = node.next
        }
        print()
    }
}

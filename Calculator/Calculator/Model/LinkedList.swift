//
//  LinkedList.swift
//  Calculator
//
//  Created by Jae-hoon Sim on 2021/11/09.
//

import Foundation

class LinkedList<Element> {
    private(set) var head: Node<Element>?
    private(set) var tail: Node<Element>?
    private(set) var count = 0
    var isEmpty: Bool {
        head == nil ? true : false
    }
    var first: Element? {
        head?.value
    }
    var last: Element? {
        tail?.value
    }
    
    func append(_ item: Element) {
        let newNode = Node(item)
        
        guard let node = tail else {
            head = newNode
            tail = newNode
            count += 1
            return
        }
        
        node.next = newNode
        tail = newNode
        count += 1
    }
    
    func removeFirst() -> Element? {
        let removedNodeValue = head?.value
        let nextHeadNode = head?.next
        
        if isEmpty {
            head = nextHeadNode
            tail = head
        } else {
            head = nextHeadNode
            count -= 1
        }
        return removedNodeValue
    }
    
    func removeAll() {
        head = nil
        tail = nil
        count = 0
    }
}

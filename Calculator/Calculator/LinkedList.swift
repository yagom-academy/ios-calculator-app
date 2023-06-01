//
//  LinkedList.swift
//  Calculator
//
//  Created by idinaloq on 2023/05/29.
//

extension LinkedList {
    func currentHead() -> Node<Element>? {
        return head
    }
    
    func currentTail() -> Node<Element>? {
        return tail
    }
}

struct LinkedList<Element> {
    private var head: Node<Element>? {
        didSet {
            guard head == nil else {
                return
            }
            tail = nil
        }
    }
    
    private var tail: Node<Element>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func append(data: Element) {
        let node: Node = Node(data: data)
        
        guard !isEmpty else {
            head = node
            tail = head
            return
        }
        tail?.next = node
        tail = node

    }
    
    mutating func removeFirst() -> Element? {
        guard !isEmpty else {
            return nil
        }
        
        let headData = head?.data
        head = head?.next
        
        return headData
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
}

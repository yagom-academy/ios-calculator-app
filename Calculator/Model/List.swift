//
//  List.swift
//  Calculator
//
//  Created by kokkilE on 2023/01/25.
//

struct List<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var count: Int {
        guard !isEmpty else {
            return 0
        }
        
        var count = 1
        var node = head
        
        while node?.next != nil {
            node = node?.next
            count += 1
        }
        
        return count
    }
    
    mutating func push(_ node: Node<T>) {
        if isEmpty {
            self.head = node
            self.tail = node
            return
        }
        
        node.next = head
        head = node
    }
    
    mutating func popHead() -> Node<T>? {
        defer {
            head = head?.next
            
            if isEmpty {
                tail = nil
            }
        }
        
        return head
    }
    
    mutating func removeLast() -> Node<T>? {
        guard !isEmpty else {
            return nil
        }
        guard head?.next != nil else {
            return popHead()
        }
        
        var prevNode = head
        var currentNode = head
        
        while let nextNode = currentNode?.next {
            prevNode = currentNode
            currentNode = nextNode
        }
        
        tail = prevNode
        tail?.next = nil
        
        return currentNode
    }
}


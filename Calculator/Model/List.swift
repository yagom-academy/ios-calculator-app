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
    
    func removeLast() -> Node<T>? {
        return nil
    }
}


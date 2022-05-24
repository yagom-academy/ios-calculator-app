//
//  LinkedList.swift
//  Calculator
//
//  Created by 허건 on 2022/05/18.
//

struct LinkedList<T> {
    var head: Node<T>?
    
    mutating func append(data: T?) {
        if head == nil {
            head = Node(data: data)
            return
        }
        
        var node = head
        while let newNode = node?.next {
            node = newNode
        }
        node?.next = Node(data: data)
    }
    
    mutating func pop() -> T? {
        if head == nil {
            head = nil
            return nil
        }
        
        let item = head?.data
        head = head?.next
        return item
    }
    
    mutating func peek() -> T? {
        return head?.data
    }
    
    mutating func printAll() -> [Any] {
        var elements: [Any] = []
        
        while head != nil {
            elements.append(head?.data as Any)
            head = head?.next
        }
        return elements
    }
    
    mutating func removeAll() {
        head = nil
    }
}

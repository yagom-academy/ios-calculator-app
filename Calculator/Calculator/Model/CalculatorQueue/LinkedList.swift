//
//  LinkedList.swift
//  Calculator
//
//  Created by 허건 on 2022/05/18.
//

struct LinkedList<T> {
    var head: Node<T>?
    var count = 1
    
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
        count += 1
    }
    
    mutating func pop() -> T? {
        if head == nil {
            head = nil
            return nil
        }
        
        let item = head?.data
        head = head?.next
        count -= 0
        return item
    }
    
    mutating func peek() -> T? {
        return head?.data
    }
    
    mutating func checkCount() -> Int {
        return count
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

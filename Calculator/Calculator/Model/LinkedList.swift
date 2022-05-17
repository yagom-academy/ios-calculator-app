//
//  LinkedList.swift
//  Calculator
//
//  Created by Kiwi on 2022/05/17.
//

struct Linkedlist<T> : CalculateItem {
    private(set) var head: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func append(data: T) {
            if head == nil {
                head = Node(data: data)
                return
            }
            
            var node = head
            while node?.next != nil {
                node = node?.next
            }
            node?.next = Node(data: data)
        }
}

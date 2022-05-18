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
        while node?.next != nil {
            node = node?.next
        }
        node?.next = Node(data: data)
        self.count += 1
    }
    
    mutating func removeFirst() {
        if head == nil { return }
        if head?.next == nil {
            head = nil
            return
        }

        head = head?.next
        self.count -= 1
    }
    
    mutating func printLinkedList() {
        var linkedLists: [Any] = [] // 배열? 리스트?
        var node = head
        
        while node != nil {
            linkedLists.append(node?.data as Any)
            node = node?.next
        }
        print(linkedLists)
    }
    
    mutating func removeAll() {
        head = nil
    }
}

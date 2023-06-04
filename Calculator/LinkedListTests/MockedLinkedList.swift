//
//  MockedLinkedList.swift
//  LinkedListTests
//
//  Created by Daehoon Lee on 2023/06/04.
//

@testable import Calculator

struct MockedLinkedList<T>: Listable {
    var head: Node<T>?
    var tail: Node<T>?
    
    mutating func append(_ data: T) {
        guard head != nil
        else {
            head = Node(data: data)
            tail = head
            return
        }
        
        tail?.updateNext(Node(data: data))
        tail = tail?.fetchNext()
    }
    
    mutating func removeFirst() -> T? {
        guard head != nil else { return nil }
        
        if head === tail { tail = nil }
        
        let data = head?.fetchData()
        head = head?.fetchNext()
        
        return data
    }
}

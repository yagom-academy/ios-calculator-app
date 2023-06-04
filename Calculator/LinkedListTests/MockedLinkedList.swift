//
//  MockedLinkedList.swift
//  LinkedListTests
//
//  Created by Daehoon Lee on 2023/06/04.
//

@testable import Calculator

struct MockedLinkedList<Data>: Listable {
    var head: Node<Data>?
    var tail: Node<Data>?
    
    mutating func append(_ data: Data) {
        guard head != nil
        else {
            head = Node(data: data)
            tail = head
            return
        }
        
        tail?.updateNext(Node(data: data))
        tail = tail?.fetchNext()
    }
    
    mutating func removeFirst() -> Data? {
        guard head != nil else { return nil }
        
        if head === tail { tail = nil }
        
        let data = head?.fetchData()
        head = head?.fetchNext()
        
        return data
    }
}

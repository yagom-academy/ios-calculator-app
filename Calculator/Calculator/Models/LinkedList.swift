//
//  LinkedList.swift
//  Calculator
//
//  Created by Toy on 10/6/23.
//


final class LinkedList<T> {
    private(set) var head: Node<T>?
    private(set) var tail: Node<T>?
    private(set) var count: Int = 0
    
    var isEmpty: Bool { head == nil }
    
    var first: T? { head?.data }
    
    var last: T? { tail?.data }
    
    init(data: T) {
        self.head = Node(data: data)
        self.tail = head
    }
    
    func removeAll() {
        head = nil
        tail = nil
        count = 0
    }
}

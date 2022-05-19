//
//  LinkedList.swift
//  Calculator
//
//  Created by NAMU on 2022/05/17.
//

class Node<T> {
    fileprivate var data: T?
    fileprivate var next: Node?
    
    fileprivate init(data: T?, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

struct LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    func peek() -> T? {
        return head?.data
    }
    
    mutating func append(data: T) {
        guard head != nil else {
            head = Node(data: data)
            tail = head
            return
        }
        let node = Node(data: data)
        tail?.next = node
        tail = node
    }
    
    mutating func removeFirst() -> T? {
        let result = head
        head = head?.next
        return result?.data
    }
    
    func isEmpty() -> Bool {
        head == nil ? true : false
    }
    
    mutating func removeAll() {
        head = nil
    }
}

//
//  LinkedList.swift
//  Calculator
//
//  Created by Whales on 2023/06/03.
//

class Node<T> {
    var data: T?
    var next: Node?
    
    init(data: T? = nil, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

class LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    var count: Int = 0
    
    var isEmpty: Bool {
        head == nil
    }
    
    func readHeadData() -> T? {
        return head?.data
    }
    
    func readTailData() -> T? {
        return tail?.data
    }
    
    func append(data: T?) {
        let newNode = Node(data: data)
        tail?.next = newNode
        tail = newNode
        count += 1
    }
}

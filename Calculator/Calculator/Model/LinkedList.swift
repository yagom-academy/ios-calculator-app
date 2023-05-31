//
//  LinkedList.swift
//  Calculator
//
//  Created by Yena on 2023/05/30.
//

import Foundation

class Node<T> {
class Node<T: CalculateItem> {
    var data: T
    var next: Node?
    
    init(data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

class LinkedList<T> {
    private var head: Node<T>?
    var count: Int = Int()
    var isEmpty: Bool = Bool()
class LinkedList<T: CalculateItem> {
    private(set) var head: Node<T>?
    private(set) var tail: Node<T>?
    
    init(head: Node<T>) {
        self.head = head
    }
    
    func enqueue(_ element: T) {
    var count: Int = 0
    var isEmpty: Bool { (head == nil) }
        
    }
    
//    func dequeue() -> T? {
//
//
//    }
    
    
    
    
    func printAllList() {
        var node = head
        while node != nil {
            print("\(String(describing: node?.data)) -> ", terminator: "")
            node = node?.next
    func append(_ data: T) {
        let node = Node(data: data)
        
        if isEmpty {
            head = node
            tail = head
        } else {
            tail?.next = node
            tail = node
        }
        count += 1
    }
    
    func getLastNodeData() -> Node<T>? {
        var node = head
        while node != nil {
            node = node?.next
        }
        return node
    }
    
    // 삽입할 경우
    // 1. Adds a new element at the end of the array.
    func append(data: T) {
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        node?.next = Node(data: data)
    }
    
    // 2. Inserts a new element at the specified position.
    func insert(data: T, at index: Int) {
        var node = head
        for _ in 0..<index-1 {
            if node?.next == nil { break }
            node = node?.next
        }
        
        let nextNode = node?.next
        node?.next = Node(data: data)
        node?.next?.next = nextNode
    }
    
    // 삭제할 경우
    // 1. remove(at:): Removes and returns the element at the specified position.
    // 2. removeFirst(): Removes and returns the first element of the collection.
    // 3. removeLast(): Removes and returns the last element of the collection.
}

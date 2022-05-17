//
//  Calculator.swift
//  Calculator
//
//  Created by 허건 on 2022/05/17.
//

import Foundation

class Node<T> {
    var data: T?
    var next: Node<T>?
    
    init(data: T?, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

struct LinkedList<T> {
    var head: Node<T>?
    var count = 0
    
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
        // head를 삭제하는 경우
        if head?.next == nil {
            head = nil
            return
        }
        let node = head

        node?.data = node?.next?.data
        node?.next = node?.next?.next
    }
    
    mutating func removeAll() {
        head = nil
    }
}

class CalculatorItemQueue<T>: CalculatorItem {

    var linkedList = LinkedList<T>()
    
    var count : Int {
        return linkedList.count
    }
    
    public func enqueue(_ element: T) {
        linkedList.append(data: element)
    }
    
    public func dequeue() {
        linkedList.removeFirst()
    }
    public func clear(_ element: T) {
        linkedList.removeAll()
    }

}


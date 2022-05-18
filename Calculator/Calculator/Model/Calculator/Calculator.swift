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
    
    public func printLists() {
        linkedList.printLinkedList()
    }
    
    public func clear() {
        linkedList.removeAll()
    }
}


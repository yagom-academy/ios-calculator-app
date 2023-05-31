//
//  NumberItemLinkedList.swift
//  Calculator
//
//  Created by Hemg on 2023/05/31.
//
final class NumberItemNode<T> {
    var value: T?
    var next: NumberItemNode?
    
    init(value: T?) {
        self.value = value
    }
}

struct NumberItemLinkedList<T>: CalculateItem {
    private var head: NumberItemNode<T>?
    private var tail: NumberItemNode<T>?
    
    mutating func enqueueItem(item: T?) {
        let newNode = NumberItemNode(value: item)
        
        guard head != nil else {
            head = newNode
            tail = newNode
            return
        }
        
        tail?.next = newNode
        tail = newNode
    }
    
    mutating func dequeue() -> T? {
        guard let currentHead = head else { return nil }
        
        guard currentHead.next != nil else {
            head = nil
            tail = nil
            return currentHead.value
        }
        head = currentHead.next
        
        return currentHead.value
    }
    
}



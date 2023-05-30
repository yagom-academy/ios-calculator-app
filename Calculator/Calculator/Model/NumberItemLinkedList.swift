//
//  NumberItemLinkedList.swift
//  Calculator
//
//  Created by Hemg on 2023/05/31.
//
class NumberItemNode<T>: CalculateItem {
    let value: T
    var next: NumberItemNode?
    
    init(value: T) {
        self.value = value
    }
}

struct NumberItemLinkedList<T: Equatable>: CalculateItem {
    private var head: NumberItemNode<T>?
    private var tail: NumberItemNode<T>?
    
    mutating func enqueueItem(item: T) {
        let newNode = NumberItemNode(value: item)
        
        guard head != nil else {
            head = newNode
            tail = newNode
            return
        }
        tail?.next = newNode
        tail = newNode
    }
    
    func checkItemEmpty() -> Bool {
        return head == nil
    }
    
    mutating func dequeueItem() -> T? {
        let dequeuedItem = head?.value
        head = head?.next
        
        guard head != nil else {
            return dequeuedItem
        }
        
        tail = nil
        return dequeuedItem
    }
    
    func checkFirstItem() -> T? {
        return head?.value
    }
    
    func checkContainsItem(_ item: T) -> Bool {
        var currentNode = head
        
        while let node = currentNode {
            guard node.value == item else {
                currentNode = node.next
                continue
            }
            return true
        }
        return false
    }
}

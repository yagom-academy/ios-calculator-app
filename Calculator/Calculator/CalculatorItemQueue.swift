//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Hisop on 2023/10/05.
//

protocol CalculateItem {
   
}

struct CalculateItemQueue {
    var head: CalculateItemNode<Any>?
    var tail: CalculateItemNode<Any>?
    var itemCount = 0
    
    final class CalculateItemNode<T>: CalculateItem {
       var value: T
       var next: CalculateItemNode?
       
       init (value: T) {
           self.value = value
       }
    }
    
    mutating func enqueue(value: Any) {
        let newNode = CalculateItemNode(value: value)
        if head == nil {
            head = newNode
            tail = newNode
        } else {
            tail?.next = newNode
            tail = newNode
        }
        itemCount += 1
    }
    
    mutating func dequeue() -> Any? {
        guard let headNode = head else {
            return nil
        }
        
        head = headNode.next
        if head == nil {
            tail = nil
        }
        itemCount -= 1
        return headNode.value
    }
    
    mutating func clear() {
        head = nil
        tail = nil
    }
    
    func peek() -> Any? {
        return head?.value
    }
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    func count() -> Int {
        return itemCount
    }
}

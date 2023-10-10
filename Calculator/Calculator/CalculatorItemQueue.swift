//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Hisop on 2023/10/05.
//

protocol CalculateItem { }

extension Int: CalculateItem { }

struct CalculateItemList<T> {
    final private class CalculateItemNode: CalculateItem {
       var value: T
       var next: CalculateItemNode?
       
       init (value: T) {
           self.value = value
       }
    }
    
    private var head: CalculateItemNode?
    private var tail: CalculateItemNode?
    private var count = 0
    
    var headValue: T? {
        return head?.value
    }
    
    var checkEmpty: Bool {
        return head == nil
    }
    
    var itemCount: Int {
        return count
    }
    
    mutating func appendNode(value: T) {
        let newNode = CalculateItemNode(value: value)
        if head == nil {
            head = newNode
            tail = newNode
        } else {
            tail?.next = newNode
            tail = newNode
        }
        count += 1
    }
    
    mutating func removeFirstNode() -> T? {
        guard let headNode = head else {
            return nil
        }
        
        head = headNode.next
        if head == nil {
            tail = nil
        }
        count -= 1
        return headNode.value
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
}

struct CalculateItemQueue<T> where T: CalculateItem {
    var list = CalculateItemList<T>()
    
    mutating func enqueue(value: T) {
        list.appendNode(value: value)
    }
    
    @discardableResult
    mutating func dequeue() -> T? {
        return list.removeFirstNode()
    }
    
    func peek() -> T? {
        return list.headValue
    }
    
    mutating func clear() {
        list.removeAll()
    }
    
    func isEmpty() -> Bool {
        return list.checkEmpty
    }
    
    func count() -> Int {
        return list.itemCount
    }
}

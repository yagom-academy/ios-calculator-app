//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by MARY on 2023/05/30.
//

protocol CalculateItem { }

class Item {
    var data: String
    var next: Item?
    var prev: Item?
    
    init(data: String, next: Item? = nil, prev: Item? = nil) {
        self.data = data
        self.next = next
        self.prev = prev
    }
}

struct CalculatorItemQueue: CalculateItem {
    var head: Item?
    var tail: Item?
    var size: Int = 0
    var isEmpty: Bool { size == 0 }
    
    mutating func enqueue(_ element: String) {
        let newItem = Item(data: element)
        
        if isEmpty {
            head = newItem
            tail = head
        } else {
            tail?.next = newItem
            newItem.prev = tail
            tail = newItem
        }
        size += 1
    }
    
    mutating func dequeue() -> String? {
        guard let result = head?.data else { return nil }
        
        head = head?.next
        head?.prev = nil
        size -= 1
        
        if isEmpty {
            head = nil
            tail = nil
        }
        
        return result
    }
    
    mutating func resetQueue() {
        head = nil
        tail = nil
        size = 0
    }
}

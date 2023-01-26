//  Queue.swift
//  Created by 레옹아범 on 2023/01/24.

extension String: CalculateItem {
}

struct LinkedList {
    var head: Node<String>?
    var tail: Node<String>?
    
    var isEmpty: Bool {
        return self.head == nil
    }
    
    mutating func enqueue(_ node: String) {
    }
    
    mutating func dequeue() -> CalculateItem {
        //
        return "abc"
    }
    
    mutating func removeAll() {
        self.head = nil
        self.tail = nil
    }
}

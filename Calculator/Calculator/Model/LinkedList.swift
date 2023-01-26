//  Queue.swift
//  Created by 레옹아범 on 2023/01/24.

extension String: CalculateItem {
}

struct LinkedList<Element: CalculateItem> {
    var head: Node<Element>?
    var tail: Node<Element>?
    
    var isEmpty: Bool {
        return self.head == nil
    }
    
    mutating func append(_ element: String) {
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

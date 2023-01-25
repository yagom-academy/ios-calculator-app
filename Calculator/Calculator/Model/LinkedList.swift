//
//  LinkedList.swift
//  Calculator
//
//  Created by 혜모리 on 2023/01/25.
//

final class LinkedList {
    private(set) var head: Node?
    private(set) var tail: Node?
    var isEmpty: Bool {
        head == nil
    }
    
    func appendLast(_ data: String) {
        guard !isEmpty, let last = tail else {
            head = Node(value: data)
            tail = head
            return
        }
        
        let node = Node(value: data)
        last.next = node
        tail = node
    }
    
    func removeLast() -> String? {
        return ""
    }
    
    func removeFirst() -> String? {
        return ""
    }
}

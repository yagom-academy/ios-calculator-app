//
//  LinkedList.swift
//  Calculator
//
//  Created by Jun Bang on 2021/11/09.
//
import Foundation

protocol CalculateItem {
    
}

class Node {
    var item: CalculateItem
    var next: Node?
    var previous: Node?
    
    init(item: CalculateItem) {
        self.item = item
    }
}

struct LinkedList {
    private var head: Node?
    private var tail: Node?
    
    var isNotEmpty: Bool {
        return head != nil
    }

    mutating func append(_ item: CalculateItem) {
        let newNode = Node(item: item)
        if let tailNode = tail {
            newNode.previous = tailNode
            tailNode.next = newNode
            tail = newNode
        } else {
            head = newNode
        }
    }
}

extension Int: CalculateItem {
    
}

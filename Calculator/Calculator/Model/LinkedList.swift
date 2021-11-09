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
    
    init(item: CalculateItem) {
        self.item = item
    }
}

struct LinkedList {
    private var head: Node?
    
    var isNotEmpty: Bool {
        return head != nil
    }

    mutating func append(_ item: CalculateItem) {
        let newNode = Node(item: item)
        if let head = head {
            head.next = newNode
        } else {
            head = newNode
        }
    }
}

extension Int: CalculateItem {
    
}

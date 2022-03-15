//
//  LinkedList.swift
//  Calculator
//
//  Created by LIMGAUI on 2022/03/15.
//

import Foundation

final class LinkedList {
    var head: Node?
    var tail: Node?
    
    init(head: Node? = nil) {
        self.head = head
        self.tail = head
    }
    
    var count: Int {
        guard var node = self.head else {
            return 0
        }
        var count = 1
        while node.next != nil {
            count += 1
            node = node.next!
        }
        return count
    }
    
    func findNode(at index: Int) -> Node? {
        guard var node = self.head else {
            return nil
        }
        for _ in 1..<index {
            guard let nextNode = node.next else {
                return nil
            }
            node = nextNode
        }
        return node
    }
}

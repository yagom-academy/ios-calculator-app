//
//  Node.swift
//  Calculator
//
//  Created by jiye Yi on 2023/01/25.
//

import Foundation

class Node {
    var prev: Node?
    var head: String
    var next: Node?
    
    init(prev: Node? = nil, head: String, next: Node? = nil) {
        self.prev = prev
        self.head = head
        self.next = next
    }
}

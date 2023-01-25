//
//  Node.swift
//  Calculator
//
//  Created by 혜모리 on 2023/01/25.
//

final class Node: Equatable {
    var value: String
    var next: Node?
    
    init(value: String, next: Node? = nil) {
        self.value = value
        self.next = next
    }
    
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.next == rhs.next && lhs.value == rhs.value
    }
}

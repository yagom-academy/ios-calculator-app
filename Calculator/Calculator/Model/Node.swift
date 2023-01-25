//
//  Node.swift
//  Calculator
//
//  Created by 혜모리 on 2023/01/25.
//

class Node {
    var value: String
    var next: Node?
    
    init(value: String, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

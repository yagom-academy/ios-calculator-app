//
//  Node.swift
//  Calculator
//
//  Created by 혜모리, 릴라 on 2023/01/25.
//

final class Node<T: CalculateItem> {
    var value: T
    var next: Node?
    
    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

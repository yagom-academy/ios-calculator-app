//
//  Node.swift
//  Calculator
//
//  Created by kaki on 2023/01/25.
//

final class Node<T> {
    private(set) var data: T
    var next: Node<T>?
    
    init(_ data: T, next: Node<T>? = nil) {
        self.data = data
        self.next = next
    }
}

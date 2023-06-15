//
//  Node.swift
//  Calculator
//
//  Created by mint, Whales on 2023/06/12.
//

final class Node<T> {
    var data: T
    var next: Node?
    
    init(data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

//
//  Node.swift
//  Calculator
//
//  Created by Daehoon Lee on 2023/05/30.
//

final class Node<T> {
    let data: T
    let next: Node?
    
    init(data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

//
//  Node.swift
//  Calculator
//
//  Created by idinaloq on 2023/05/29.
//

final class Node<T> {
    let data: T
    var next: Node<T>?
    
    init(data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

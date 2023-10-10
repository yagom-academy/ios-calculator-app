//
//  Node.swift
//  Calculator
//
//  Created by uemu on 2023/10/09.
//

final class Node<T> {
    private(set) let value: T
    var next: Node<T>?
    
    init(value: T) {
        self.value = value
    }
}

//
//  Node.swift
//  Calculator
//
//  Created by uemu on 2023/10/09.
//

class Node<T> {
    var value: T
    var next: Node<T>?
    
    init(value: T) {
        self.value = value
    }
}

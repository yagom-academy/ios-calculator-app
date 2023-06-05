//
//  Node.swift
//  Calculator
//
//  Created by kangkyungmin on 2023/06/01.
//

final class Node<T> {
    var value: T
    var previousNode: Node<T>?
    
    init(value: T) {
        self.value = value
    }
}

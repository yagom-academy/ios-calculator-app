//
//  Node.swift
//  Calculator
//
//  Created by kaki on 2023/01/25.
//

final class Node<T> {
    weak var prev: Node?
    var data: T?
    var next: Node?
    
    init(_ data: T?) {
        self.data = data
    }
}

//
//  Node.swift
//  Calculator
//
//  Created by Toy on 10/6/23.
//


final class Node<T> {
    private(set) var data: T
    var next: Node?
    
    init(data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

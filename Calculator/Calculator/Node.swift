//
//  Node.swift
//  Calculator
//
//  Created by JIWOONG on 2024/02/17.
//

class Node<E> {
    let data: E
    let next: Node?
    
    init(data: E, next: Node?) {
        self.data = data
        self.next = next
    }
}

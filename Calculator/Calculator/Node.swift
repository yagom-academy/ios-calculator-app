//
//  Node.swift
//  Calculator
//
//  Created by idinaloq on 2023/05/29.
//

final class Node<Value> {
    let data: Value
    var next: Node<Value>?
    
    init(data: Value, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

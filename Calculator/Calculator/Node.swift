//
//  Node.swift
//  Calculator
//
//  Created by redmango1446 on 2023/06/01.
//

final class Node<T> {
    var data: T?
    var next: Node?
    
    init(data: T?, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

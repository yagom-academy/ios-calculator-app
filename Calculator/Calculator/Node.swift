//
//  Node.swift
//  Calculator
//
//  Created by JIWOONG on 2024/02/17.
//

import Foundation

class Node<T> {
    let data: T
    var next: Node?
    
    init(data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

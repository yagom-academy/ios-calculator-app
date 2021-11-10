//
//  Node.swift
//  Calculator
//
//  Created by 황제하 on 2021/11/09.
//

import Foundation

class Node<T> {
    var value: T
    var next: Node?
    
    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        return "\(self.value)"
    }
}

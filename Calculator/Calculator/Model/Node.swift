//
//  Node.swift
//  Calculator
//
//  Created by 박병호 on 2021/11/08.
//

import Foundation

class Node<T> {
    var data: T?
    var next: Node?
    
    init(data: T?, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

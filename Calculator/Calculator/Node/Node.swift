//
//  Node.swift
//  Calculator
//
//  Created by Baek on 2022/05/19.
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

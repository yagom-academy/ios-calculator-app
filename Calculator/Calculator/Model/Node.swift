//  Node.swift
//  Calculator
//  Created by LIMGAUI on 2022/03/15.

import Foundation

final class Node<T> {
    var data: T?
    var next: Node?
    
    init(data: T?, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

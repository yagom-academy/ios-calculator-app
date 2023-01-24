//  Node.swift
//  Created by 레옹아범 on 2023/01/24.

final class Node {
    weak var prev: Node?
    weak var next: Node?
    var value: String
    
    init(prev: Node? = nil, next: Node? = nil, value: String) {
        self.prev = prev
        self.next = next
        self.value = value
    }
}

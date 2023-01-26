//  Node.swift
//  Created by 레옹아범 on 2023/01/24.

final class Node {
    var next: Node?
    var value: CalculateItem
    
    init(next: Node? = nil, value: CalculateItem) {
        self.next = next
        self.value = value
    }
}

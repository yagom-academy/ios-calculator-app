//  Node.swift
//  Created by zhilly on 2022/09/23.

class Node<T: CalculateItem> {
    let data: T
    var next: Node?
    
    init(data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

//  Node.swift
//  Created by zhilly and Gundy on 2022/10/04.

class Node<T: CalculateItem> {
    let data: T
    var next: Node?
    
    init(data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

//
//  Node.swift
//  Calculator
//
//  Created by 이정민 on 2022/09/19.
//

class Node<Item> {
    let data: Item
    var next: Node<Item>?
    
    init(data: Item) {
        self.data = data
    }
}

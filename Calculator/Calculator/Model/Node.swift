//  Node.swift
//  Created by 레옹아범 on 2023/01/24.

final class Node<Element: CalculateItem> {
    var next: Node?
    var value: Element
    
    init(prev: Node? = nil, next: Node? = nil, value: Element) {
        self.next = next
        self.value = value
    }
}

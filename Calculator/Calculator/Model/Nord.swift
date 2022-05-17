//
//  Nord.swift
//  Calculator
//
//  Created by Kiwi on 2022/05/17.
//

class Node<T> : CalculateItem {
    private(set) var data: T?
    var next: Node<T>?
    
    init(data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

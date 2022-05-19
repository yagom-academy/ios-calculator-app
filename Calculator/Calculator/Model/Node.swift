//
//  Nord.swift
//  Calculator
//
//  Created by Kiwi on 2022/05/17.
//

final class Node<T>: CalculateItem {
    private(set) var data: T?
    var next: Node<T>?
    
    init(data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

extension Node: Equatable {
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        lhs === rhs
    }
}

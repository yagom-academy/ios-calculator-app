//
//  Node.swift
//  Calculator
//
//  Created by DuDu on 2022/03/14.
//

final class Node<Element: CalculateItem> {
    var data: Element
    var next: Node<Element>? = nil
    weak var prev: Node<Element>? = nil
    
    init(data: Element) {
        self.data = data
    }
}

extension Node: Equatable {
    static func == (lhs: Node<Element>, rhs: Node<Element>) -> Bool {
        lhs === rhs
    }
}

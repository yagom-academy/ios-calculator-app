//
//  Node.swift
//  Calculator
//
//  Created by MARY on 2023/05/31.
//

final class Node<Element> {
    var element: Element
    var next: Node?
    
    init(element: Element) {
        self.element = element
    }
}

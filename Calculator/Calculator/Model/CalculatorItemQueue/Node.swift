//
//  Node.swift
//  Calculator
//
//  Created by karen, Mary.
//

final class Node<Element> {
    var element: Element
    var next: Node?
    
    init(element: Element) {
        self.element = element
    }
}

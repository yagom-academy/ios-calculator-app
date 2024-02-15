//
//  Node.swift
//  Calculator
//
//  Created by Jaehun Lee on 2/6/24.
//

class Node<Element: Equatable> {
    private(set) var element: Element?
    private(set) var prev: Node<Element>? = nil
    private(set) var next: Node<Element>? = nil
    
    init(element: Element? = nil) {
        self.element = element
    }
    
    func setPreviousNode(as node: Node<Element>) {
        prev = node
    }
    
    func setNextNode(as node: Node<Element>) {
        next = node
    }
}

extension Node: Equatable {
    static func ==(lhs: Node<Element>, rhs: Node<Element>) -> Bool {
        lhs.element == rhs.element && lhs.next == rhs.next
    }
}

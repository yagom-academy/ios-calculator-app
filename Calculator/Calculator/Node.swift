//
//  Node.swift
//  Calculator
//
//  Created by Jaehun Lee on 2/6/24.
//

class Node<Element> {
    private(set) var element: Element?
    private(set) var prev: Node<Element>? = nil
    private(set) var next: Node<Element>? = nil
    
    init(element: Element? = nil) {
        self.element = element
    }
    
    func setPrev(node: Node<Element>) {
        prev = node
    }
    
    func setNext(node: Node<Element>) {
        next = node
    }
}

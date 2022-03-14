//
//  Node.swift
//  Calculator
//
//  Created by DuDu on 2022/03/14.
//

class Node<Element> {
    var data: Element?
    var next: Node<Element>? = nil
    weak var prev: Node<Element>? = nil
    
    init(data: Element? = nil) {
        self.data = data
    }
}

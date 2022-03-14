//
//  LinkedList.swift
//  Calculator
//
//  Created by DuDu on 2022/03/14.
//

struct LinkedList<Element> {
    private var head: Node<Element>?
    private var tail: Node<Element>?
    
    init() {
        head = Node<Element>()
        tail = Node<Element>()
    }
}

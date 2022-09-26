//
//  Node.swift
//  Calculator
//
//  Created by Kyo on 2022/09/19.
//

final class Node<Element> {
    private var data: Element
    private var next: Node<Element>?
    
    init(_ data: Element) {
        self.data = data
    }
    
    func bringNodeData() -> Element {
        return self.data
    }
    
    func bringNextNode() -> Node<Element>? {
        return next
    }
    
    func setNextNode(node: Node<Element>) {
        self.next = node
    }
}

//
//  CalculatorItemNode.swift
//  Calculator
//
//  Created by Hamo on 2022/09/20.
//

class Node<Element: CalculateItem> {
    private var data: Element
    private var next: Node?
    
    init(data: Element) {
        self.data = data
    }
    
    func bringData() -> Element {
        return data
    }
    
    func bringNextNode() -> Node? {
        return next
    }
    
    func setNextNode(destination: Node) {
        next = destination
    }
}

//
//  CalculatorItemNode.swift
//  Calculator
//
//  Created by Hamo on 2022/09/20.
//

final class Node<Element: CalculateItem> {
    private(set) var data: Element
    private(set) var next: Node?
    
    init(data: Element) {
        self.data = data
    }
    
    func setNextNode(destination: Node) {
        next = destination
    }
}

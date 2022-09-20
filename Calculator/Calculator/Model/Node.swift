//
//  CalculatorItemNode.swift
//  Calculator
//
//  Created by Hamo on 2022/09/20.
//

class Node {
    private var data: CalculateItem
    private var next: Node?
    
    init(data: CalculateItem) {
        self.data = data
    }
    
    func bringData() -> CalculateItem {
        return data
    }
    
    func bringNextNode() -> Node? {
        return next
    }
    
    func setNextNode(destination: Node) {
        next = destination
    }
}

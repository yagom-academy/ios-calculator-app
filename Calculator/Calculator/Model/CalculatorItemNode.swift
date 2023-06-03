//
//  CalculatorItemNode.swift
//  Calculator
//
//  Created by Min Hyun on 2023/05/29.
//

class CalculatorItemNode<Element: CalculateItem> {
    private(set) var value: Element
    private(set) var next: CalculatorItemNode?
    
    init(_ value: Element) {
        self.value = value
    }
    
    func changeNext(_ next: CalculatorItemNode?) {
        self.next = next
    }
}

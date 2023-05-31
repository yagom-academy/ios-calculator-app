//
//  CalculatorItemNode.swift
//  Calculator
//
//  Created by Min Hyun on 2023/05/29.
//

class CalculatorItemNode {
    private(set) var value: CalculateItem
    private(set) var next: CalculatorItemNode?
    
    init(_ value: CalculateItem) {
        self.value = value
    }
    
    func changeNext(_ next: CalculatorItemNode?) {
        self.next = next
    }
}

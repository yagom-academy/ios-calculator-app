//
//  CalculatorItemNode.swift
//  Calculator
//
//  Created by Min Hyun on 2023/05/29.
//

class CalculatorItemNode {
    var value: CalculateItem
    var next: CalculatorItemNode?
    var previous: CalculatorItemNode?
    
    init(_ value: CalculateItem) {
        self.value = value
    }
    
    func changeNext(_ next: CalculatorItemNode) {
        self.next = next
    }
    
    func changePrevious(_ previous: CalculatorItemNode) {
        self.previous = previous
    }
}

//
//  CalculatorItemNode.swift
//  Calculator
//
//  Created by Min Hyun on 2023/05/29.
//

class CalculatorItemNode {
    private(set) var value: CalculateItem
    private(set) var next: CalculatorItemNode?
    private(set) var previous: CalculatorItemNode?
    
    init(_ value: CalculateItem) {
        self.value = value
    }
    
    func changeNext(_ next: CalculatorItemNode?) {
        self.next = next
    }
    
    func changePrevious(_ previous: CalculatorItemNode?) {
        self.previous = previous
    }
}

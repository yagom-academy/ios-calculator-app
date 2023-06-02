//
//  CalculatorItemNode.swift
//  Calculator
//
//  Created by Min Hyun on 2023/05/29.
//

class CalculatorItemNode<T: CalculateItem> {
    private(set) var value: T
    private(set) var next: CalculatorItemNode?
    
    init(_ value: T) {
        self.value = value
    }
    
    func changeNext(_ next: CalculatorItemNode?) {
        self.next = next
    }
}

//
//  CalculatorItemNode.swift
//  Calculator
//
//  Created by Hamo on 2022/09/20.
//

class CalculatorItemNode {
    private var data: CalculateItem
    private var next: CalculatorItemNode?
    
    init(data: CalculateItem) {
        self.data = data
    }
    
    func bringData() -> CalculateItem {
        return data
    }
    
    func bringNextNode() -> CalculatorItemNode? {
        return next
    }
}

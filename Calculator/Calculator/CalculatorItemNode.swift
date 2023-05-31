//
//  CalculatorItemNode.swift
//  Calculator
//
//  Created by MARY on 2023/05/31.
//

final class CalculatorItemNode {
    var item: CalculateItem
    var next: CalculatorItemNode?
    
    init(item: CalculateItem) {
        self.item = item
    }
}

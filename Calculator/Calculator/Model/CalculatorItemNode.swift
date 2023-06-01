//
//  CalculatorItemNode.swift
//  Calculator
//
//  Created by Erick on 2023/05/30.
//

final class CalculatorItemNode {
    var item: CalculateItem
    var next: CalculatorItemNode? = nil
    
    init(item: CalculateItem) {
        self.item = item
    }
}

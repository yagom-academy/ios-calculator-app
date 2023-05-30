//
//  Node.swift
//  Calculator
//
//  Created by Erick on 2023/05/30.
//

class CalculateItemNode {
    var item: CalculateItem
    var next: CalculateItemNode? = nil
    
    init(item: CalculateItem) {
        self.item = item
    }
}

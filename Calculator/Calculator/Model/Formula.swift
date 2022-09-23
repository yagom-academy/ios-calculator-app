//
//  Formula.swift
//  Calculator
//
//  Created by 이정민 on 2022/09/23.
//

import Foundation

struct Formula<Item: CalculateItem> {
    var operands: CalculatorItemQueue = CalculatorItemQueue<Item>()
    
    func result() -> Double {
        return 1.1
    }
}

//
//  Formula.swift
//  Calculator
//
//  Created by kokkilE on 2023/01/27.
//

struct Formula<T: CalculateItem> {
    var operands = CalculatorItemQueue<T>()
    var operators = CalculatorItemQueue<T>()
    
}

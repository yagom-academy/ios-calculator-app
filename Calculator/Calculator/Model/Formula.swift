//
//  Formula.swift
//  Calculator
//
//  Created by 김태현 on 2022/03/18.
//

struct Formula {
    var operands: CalculatorItemQueue<CalculatorItem>
    var operators: CalculatorItemQueue<CalculatorItem>
    
    func result() -> Double {
        return 1
    }
}

//
//  Formula.swift
//  Calculator
//
//  Created by 무리 on 2023/01/27.
//

struct Formula {
    // 공식
    
    // 피연산자
    var operands: CalculatorItemQueue<Double>
    
    // 연산자
    var operators: CalculatorItemQueue<Operator>
    
    func result() -> Double {
        
        return Double()
    }
}

//  Formula.swift
//  Created by 레옹아범 on 2023/01/26.

struct Formula {
    let operands: CalculatorItemQueue<<#Element: CalculateItem#>>
    let operators: CalculatorItemQueue<<#Element: CalculateItem#>>
    
    func result() -> Double {
        return 0.0
    }
}

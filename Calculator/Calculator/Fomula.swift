//
//  Fomula.swift
//  Calculator
//
//  Created by 이원빈 on 2022/05/19.
//

import Foundation

struct Fomula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Character>
    
    mutating func result() -> Double? {
        guard operands.count > 1 && operators.count >= 1 else { return nil }
        var result = Operator(rawValue: operators.dequeue()!)?
            .calculate(lhs: operands.dequeue()!, rhs: operands.dequeue()!) ?? 0
        
        while !operands.isEmpty || !operators.isEmpty {
            result = Operator(rawValue: operators.dequeue()!)?
                .calculate(lhs: result, rhs: operands.dequeue()!) ?? 0
        }
        return result
    }
}

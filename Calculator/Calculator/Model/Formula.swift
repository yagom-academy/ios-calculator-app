//
//  Formula.swift
//  Calculator
//
//  Created by leewonseok on 2022/09/20.
//

import Foundation

struct Formula {
    var operands = CalculatorItemQueue()
    var operators = CalculatorItemQueue()
    
    public mutating func result() -> Double {
        // 여기서 숫자를 하나 빼고 시작하면 operands와 operators 의 길이가 같아짐
        guard var totalNumber = operands.dequeue() as? Double else { return 0.0 }
        
        for _ in 1...operands.count {
            // 연산값
            guard let number = self.operands.dequeue() as? Double else { return 0.0 }
            // 연산자
            guard let operatorSymbol = self.operators.dequeue() as? Operator else{ return 0.0 }
            
            totalNumber = operatorSymbol.calculate(lhs: totalNumber, rhs: number)
        }
        return totalNumber
    }
}

//
//  Formula.swift
//  Calculator
//
//  Created by JeongTaek Han on 2021/11/14.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    func result() -> Double {
        guard var result = operands.dequeue() else {
            return 0.0
        }
        
        while let number = operands.dequeue(),
              let operatorInstance = operators.dequeue()
        {
            do {
                result = try operatorInstance.calculate(lhs: result, rhs: number)
                operands.dequeue()
                print("\(result), \(operatorInstance)")
            } catch {
                print(error)
            }
        }
        
        return result
    }
}

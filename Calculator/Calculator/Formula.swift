//
//  Formula.swift
//  Calculator
//
//  Created by Mangdi on 2022/09/22.
//

import Foundation
import UIKit

struct Formula {
    var operands: CalculatorItemQueue<Double>?
    var operators: CalculatorItemQueue<Operator>?
    
    mutating func result() -> Double {
        guard var result = operands?.dequeue() else {
            return 0
        }
        
        while operators?.dequeue() != nil {
            let someOperator: Operator? = operators?.dequeue()
            
            switch someOperator {
            case .add:
                result = Operator.add.calculate(lhs: result, rhs: operands?.dequeue() ?? 0)
            case .subtract:
                result = Operator.subtract.calculate(lhs: result, rhs: operands?.dequeue() ?? 0)
            case .multiply:
                result = Operator.multiply.calculate(lhs: result, rhs: operands?.dequeue() ?? 0)
            case .divide:
                result = Operator.divide.calculate(lhs: result, rhs: operands?.dequeue() ?? 1)
            case .none:
                return result
            }
        }
        
        return result
    }
}

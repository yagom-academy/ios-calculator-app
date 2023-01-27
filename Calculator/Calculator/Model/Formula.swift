//
//  Formula.swift
//  Calculator
//
//  Created by kimseongjun on 2023/01/27.
//

import Foundation
 
struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
//    mutating func result() -> Double {
//        guard let formerOperand = operands.dequeue() else { return 0 }
//        guard let latterOperand = operands.dequeue() else { return 0 }
//        guard let operatorType = operators.dequeue() else { return 0.0 }
//        
//        switch operatorType {
//        case Operator.add:
//            return Operator.add.add(lhs: formerOperand, rhs: latterOperand)
//        case .subtract:
//            return Operator.subtract.subtract(lhs: formerOperand, rhs: latterOperand)
//        case .divide:
//            return Operator.divide.divide(lhs: formerOperand, rhs: latterOperand)
//        case .multiply:
//            return Operator.multiply.multiply(lhs: formerOperand, rhs: latterOperand)
//        }
//    }
}

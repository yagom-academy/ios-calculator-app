//
//  Formula.swift
//  Calculator
//
//  Created by yyss99 on 2023/06/07.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Character>
    
    mutating func result() -> Double {
        guard let lhs = operands.dequeue() else { return 0.0 }
        guard let rhs = operands.dequeue() else { return 0.0 }
        guard let operator1 = operators.dequeue() else { return 0.0 }
        var operator2 : Operator?
        
        switch operator1 {
        case Operator.add.rawValue:
            operator2 = .add
        case Operator.divide.rawValue:
            operator2 = .divide
        case Operator.multiply.rawValue:
            operator2 = .multiply
        case Operator.subtract.rawValue:
            operator2 = .subtract
        default:
            break
        }
        guard let selectedOperator = operator2 else { return 0.0 } //nil인 경우를 처리
        
        return selectedOperator.calculate(lhs: lhs, rhs: rhs)
    }
}

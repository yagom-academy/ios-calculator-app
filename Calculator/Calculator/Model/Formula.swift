//
//  Formula.swift
//  Calculator
//
//  Created by yyss99 on 2023/06/07.
//

//struct Formula {
//    var operands: CalculatorItemQueue<Double>
//    var operators: CalculatorItemQueue<Operator>
//
//    mutating func result() -> Double {
//        guard let lhs = operands.dequeue() else { return 0.0 }
//        guard let rhs = operands.dequeue() else { return 0.0 }
//        guard let operator1 = operators.dequeue() else { return 0.0 }
//        var operator2 : Operator?
//
//        switch operator1 {
//        case Operator.add:
//            operator2 = .add
//        case Operator.divide:
//            operator2 = .divide
//        case Operator.multiply:
//            operator2 = .multiply
//        case Operator.subtract:
//            operator2 = .subtract
//        default:
//            break
//        }
//        guard let selectedOperator = operator2 else { return 0.0 }
//
//        return selectedOperator.calculate(lhs: lhs, rhs: rhs)
//    }
//}

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() -> Double {
        while operators.count > 0 {
            guard let operatorValue = operators.dequeue() else {
                break
            }
            
            guard let lhs = operands.dequeue(), let rhs = operands.dequeue() else {
                break
            }
            
            let result = operatorValue.calculate(lhs: lhs, rhs: rhs)
            operands.enqueue(result)
        }
        
        return operands.dequeue() ?? 0.0
    }
}

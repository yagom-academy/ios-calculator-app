//
//  Calculator.swift
//  Calculator
//
//  Created by Seungjin Baek on 2021/03/25.
//

import Foundation


enum Operation {
    case CommonOperation((Double, Double) -> Double)
    case BinaryOperation((Int, Int) -> Int)
    case BinaryUnaryOperation((Int) -> Int)
    case DecimalOperation((Double, Double) -> Double)
}

protocol DecimalOperator {
    var decimalOperations: Dictionary<Operators, Operation> { get }
}

protocol BinaryOperator {
    var binaryOperations: Dictionary<String, Operation> { get }
    var binaryUnaryOperations: Dictionary<String, Operation> { get }
}


class Calculator {
    var baseOperations: Dictionary<Operators, Operation> = [
        .add : (Operation.CommonOperation({ $0 + $1 })),
        .subtract : (Operation.CommonOperation({ $0 - $1 })),
    ]
}

class DecimalCalculator: Calculator, DecimalOperator {
    private var accummulater = 0.0
    
    var decimalOperations: Dictionary<Operators, Operation> = [
        .multiply : (Operation.DecimalOperation({ $0 * $1 })),
        .divide : (Operation.DecimalOperation({ $0 / $1 })), // 0으로 나눴을 때 오류처리
        // 결과가 Int면 Int로 보여준다.
    ]
}

class BinaryCalculator: Calculator, BinaryOperator {
    private var accumulator = 0
    
    var binaryOperations: Dictionary<String, Operation> = [
        "AND" : (Operation.BinaryOperation({ $0 & $1 })),
        "NAND" : (Operation.BinaryOperation({ ~($0 & $1) })),
        "OR" : (Operation.BinaryOperation({ $0 | $1 })),
        "NOR" : (Operation.BinaryOperation({ ~($0 | $1) })),
        "XOR" : (Operation.BinaryOperation({ $0 ^ $1 })),
    ]
    
    var binaryUnaryOperations: Dictionary<String, Operation> = [
        "NOT" : (Operation.BinaryUnaryOperation({ ~$0 })),
        "<<" : (Operation.BinaryUnaryOperation({ $0 << 1 })),
        ">>" : (Operation.BinaryUnaryOperation({ $0 >> 1 }))
    ]
}




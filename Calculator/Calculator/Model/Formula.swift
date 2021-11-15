//
//  Formula.swift
//  Calculator
//
//  Created by yeha on 2021/11/15.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>

    init() {
        self.operands = CalculatorItemQueue<Double>()
        self.operators = CalculatorItemQueue<Operator>()
    }

//    mutating func result() -> Double {
//        var inputString: String = "1.1+1.1"
//        let addCharacter: Character = "+"
//        inputString.split(separator: addCharacter)
//
//        let operatorEnum = Operator(rawValue: addCharacter)
//        var result: Double?
//
//        operands.enqueue(inputString[)
//        operands.enqueue(inputString[1])
//
//        result = operatorEnum?.calculate(operands.dequeue() ?? 0.0, operands.dequeue() ?? 0.0)
//        return result ?? 0.0
//    }
}

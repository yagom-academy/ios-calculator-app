//
//  Formula.swift
//  Calculator
//
//  Created by 전민수 on 2022/05/19.
//
struct Formula {
    let operands: CalculatorItemQueue<Double>
    let operators: CalculatorItemQueue<String>
    
    func result() -> Double {
        let `operator` = operators.queue.enqueueStack[0]
        let operatorIntoEnumCase = Operator(rawValue: Character(`operator`))
        let leftOperand = operands.queue.enqueueStack[0]
        let rightOperand = operands.queue.enqueueStack[1]
        
        let result = operatorIntoEnumCase?.calculate(lhs: leftOperand, rhs: rightOperand)
        
        return result ?? 0
    }
}



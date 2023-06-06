//
//  Formula.swift
//  Calculator
//
//  Created by idinaloq on 2023/06/02.
//



struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
    
    mutating func result() -> Double {
        //1. operand dequeue x 2
        //2. operator dequeue
        //3. lhs에 operand 할당
        //4. rhs에 operand 할당
        //5. operators 연산
        //6. operand dequeue
        //7. operator dequeue
        //8. 5번의 연산결과 = lhs할당, rhs할당 후 연산
        //9. 리스트 길이만큼 반복
        guard let lhsOperand: Double = operands.dequeue() else {
            return 0
            //return throw 구문
        }
        
        guard let operatorValue: Operator = operators.dequeue() else {
            return 0
            //return throw 구문
        }
        
        guard let rhsOperand: Double = operands.dequeue() else {
            return 0
            //return throw 구문
        }
        
        var result: Double = operatorValue.calculate(lhs: lhsOperand, rhs: rhsOperand)
        return result
    }
}

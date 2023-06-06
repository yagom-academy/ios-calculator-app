//
//  Formula.swift
//  Calculator
//
//  Created by idinaloq on 2023/06/02.
//



struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue<Double>()
    var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue<Operator>()
    
    mutating func result() -> Double {
        //1. operand dequeue x 2
        //2. operator dequeue
        //3. lhs에 operand 할당
        //4. rhs에 operand 할당
        //5. operators 연산
        //6. operand dequeue
        //7. operator dequeue
        //8. 5번의 연산결과 = lhs할당, rhs할당 후 연산
        //9. 반복
        //연산되어 나온값은 lhs에 다시 입력해서 연산.
        //첫 번째 operand를 dequeue하면 정상적인 상황일 때 operators와 operands의 길이는 같을 것이다
        //그다음 operators에서 먼저 꺼내고, operands에서 꺼내면 operands의 head가 nil이 되는 시점까지 반복시키기
        
        var isEmptyOperators: Bool = operators.currentList().isEmpty
        var isEmptyOperands: Bool = operands.currentList().isEmpty
        var result: Double = 0
        
        guard let lhs: Double = operands.dequeue() else {
            return 0
            //return throw 구문
        }
        
        guard let rhs: Double = operands.dequeue() else {
            return 0
            //return throw 구문
        }
        
        guard let operation: Operator = operators.dequeue() else {
            return 0
            //return throw 구문
        }
        
        result = operation.calculate(lhs: lhs, rhs: rhs)
        
        while !(isEmptyOperators || isEmptyOperands) {
            var lhs: Double = result
            
            guard let rhs: Double = operands.dequeue() else {
                return 0
                //return throw 구문
            }
            
            guard let operation: Operator = operators.dequeue() else {
                return 0
                //return throw 구문
            }
            
            result = operation.calculate(lhs: lhs, rhs: rhs)
        }
        return result
    }
}

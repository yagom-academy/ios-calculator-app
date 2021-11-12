import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue<Double>()
    var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue<Operator>()
    
    mutating func result() -> Double? {
        //Operator의 연산자 함수들을 사용하여 계산결과 도출하기
        guard let lhs = operands.dequeue() else { return nil }
        guard let rhs = operands.dequeue() else { return nil }
        let `operator` = operators.dequeue()
        let calculateResult = `operator`?.calculate(lhs: lhs, rhs: rhs)
        
        return calculateResult
    }
}

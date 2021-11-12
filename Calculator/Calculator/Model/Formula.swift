import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue<Double>()
    var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue<Operator>()
    
    mutating func result() -> Double? {
        //Operator의 연산자 함수들을 사용하여 계산결과 도출하기
        
        for i in 0...operands.countItems()-2 {
            guard let lhs = operands.dequeue() else { return nil }
            guard let rhs = operands.dequeue() else { return nil }
            
            let `operator` = operators.dequeue()
            guard let calculateResult = `operator`?.calculate(lhs: lhs, rhs: rhs) else { return nil }
            
            operands.enqueue(calculateResult)
        }
        
        let result = operands.dequeue()
        
        
        return result
    }
}

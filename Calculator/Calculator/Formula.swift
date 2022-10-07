//  Created by Aejong on 2022/09/27.

struct Formula {
    var operands: CalculatorItemQueueByLinkedList<Double>
    var operators: CalculatorItemQueueByLinkedList<Operator>
    
    mutating func result() throws -> Double {
        guard var result: Double = operands.dequeue() else {
            throw CalculateError.emptyOperands
        }
        
        while !operands.isEmpty {
            guard let rhs = operands.dequeue(),
                  let unitOperator = operators.dequeue() else {
                throw CalculateError.emptyOperators
            }
            
            result = try unitOperator.calculate(lhs: result, rhs: rhs)
        }
        
        return result
    }
}

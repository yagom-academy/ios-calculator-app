//  Created by Aejong on 2022/09/27.

struct Formula {
    var operands: CalculatorItemQueueByLinkedList<Double>
    var operators: CalculatorItemQueueByLinkedList<Operator>
    
    mutating func result() -> Double {
        guard let lhs = operands.dequeue(),
              let rhs = operands.dequeue(),
              let unitOperator = operators.dequeue() else { return 0 }
        
        
        return unitOperator.calculatee(lhs: lhs, rhs: rhs)
    }
}

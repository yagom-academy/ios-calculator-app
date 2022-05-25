import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double> = []
    var operators: CalculatorItemQueue<Operator> = []
    
    mutating func result() -> Result<Double, Error> {
        guard var addedLhs = operands.pop() else {
            return .failure(LinkedListError.indexOutOfRange)
        }
        
        while operators.count > .zero {
            guard let `operator` = operators.pop(), let rhs = operands.pop() else {
                return .failure(LinkedListError.indexOutOfRange)
            }
            if (`operator` == .divide) && (rhs == .zero) {
                return .failure(FormulaError.notANumber)
            }
            addedLhs = `operator`.calculate(lhs: addedLhs, rhs: rhs)
        }
        
        return .success(addedLhs)
    }
}

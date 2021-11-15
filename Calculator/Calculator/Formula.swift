import Foundation

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Character>()
    
    func result() throws -> Double {
        guard var tempValue = try? operands.deleteFromQueue() else {
            throw ErrorCase.emptyQueue
        }
        while operands.linkedList.head != nil {
            if let currentOperand = try? operands.deleteFromQueue(),
               let currentOperator = try? operators.deleteFromQueue() {
                let operatorCase = Operator(rawValue: currentOperator)
                tempValue = operatorCase?.calculate(lhs: tempValue, rhs: currentOperand) ?? 0
            }
        }
        return tempValue
    }
}

import Foundation

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Character>()
    
    func result() -> Double {
        guard var tempValue = try? operands.deleteFromQueue() else {
            return 0
        }
        while operands.linkedList.head != nil {
            guard let currentOperand = try? operands.deleteFromQueue(),
                  let currentOperator = try? operators.deleteFromQueue(),
                  let operatorCase = Operator(rawValue: currentOperator) else {
                      return 0
                  }
            tempValue = operatorCase.calculate(lhs: tempValue, rhs: currentOperand)
        }
        return tempValue
    }
}

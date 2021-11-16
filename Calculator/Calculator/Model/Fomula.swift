
import Foundation

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var oprators = CalculatorItemQueue<Operator>()
    let operations = Operator.allCases.map{ $0.rawValue }
    
    func result() throws -> Double {
        var currentNumber = 0.0
        
        while !oprators.linkedList.isEmpty {
            do {
                let eachOperation = try oprators.linkedList.dequeueWithData()
                let firstOperand = operands.linkedList.head?.data
                let secondOperand = operands.linkedList.head?.data
                let resultOfOperlate = Operator.calculate(.add).(lhs: <#T##Double#>, rhs: <#T##Double#>)
                currentNumber += resultOfoperation
            } catch error as Error {
                
            }
        }
        return currentNumber
    }
}

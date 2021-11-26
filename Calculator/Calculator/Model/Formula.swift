
import Foundation

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Character>()
    
    func result() -> Double {
        guard var temporaryValue = try? operands.deleteFromQueue() else {
            return .zero
        }
        
        while operands.linkedList.head != nil {
            do {
                let currentOperand = try operands.deleteFromQueue()
                let currentOperator = try operators.deleteFromQueue()
                let operatorCase = Operator(rawValue: currentOperator)
                temporaryValue = operatorCase?.calculate(lhs: temporaryValue, rhs: currentOperand) ?? .zero
            }
            catch let error as CalculatorError {
                print(fatalError())
            }
            catch {
                print("확인되지 않은 에러가 발생했습니다.")
            }
        }
        return temporaryValue
    }
}


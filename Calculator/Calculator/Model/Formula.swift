import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue()
    var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue()
    
    mutating func result() throws -> Double { // TODO: do-catch 구문 필요
        guard let removedOperand = operands.dequeue() else {
            throw FormulaError.queueIsEmpty
        }
        
        let result: Double = try operators.scanAllValues().reduce(removedOperand) {
            guard let nextOperand = operands.dequeue() else {
                throw FormulaError.queueIsEmpty
            }
            return $1.calculate(lhs: $0, rhs: nextOperand)
        }
        
        return result
    }
}

enum FormulaError: Error, LocalizedError {
    case queueIsEmpty
    
    var description: String {
        switch self {
        case .queueIsEmpty:
            return "Dequeue 할 값이 존재하지 않습니다"
        }
    }
}

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double> = []
    var operators: CalculatorItemQueue<Operator> = []
    
    init() { }
    init(by expression: String) {
        expression.forEach {
            if let operand = Double(String($0)) {
                operands.push(element: operand)
            } else {
                guard let `operator` = Operator(rawValue: $0) else { return }
                operators.push(element: `operator`)
            }
        }
    }
    
    mutating func result() -> Double {
        guard var addedLhs = operands.pop() else { return 0.0 }
        
        while operators.count > 0 {
            guard let rhs = operands.pop() else { return 0.0 }
            guard let `operator` = operators.pop() else { return 0.0 }
            addedLhs = `operator`.calculate(lhs: addedLhs, rhs: rhs)
        }
        
        return addedLhs
    }
}

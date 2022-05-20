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
}

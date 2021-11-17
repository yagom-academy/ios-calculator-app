import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let formula = Formula()
        let componentsOfOperands = Self.componentsByOperators(from: input)
        
        componentsOfOperands.forEach { operand in
            if let operandInDouble = Double(operand) {
                formula.operands.enqueue(value: operandInDouble)
            }
        }
        
        for characterOfInput in input {
            if let symbol = Operator(rawValue: characterOfInput) {
                formula.operators.enqueue(value: symbol)
            }
        }
        
        return formula
    }
  
    static func componentsByOperators(from input: String) -> [String] {
        var components: [String] = [input]

        components = Operator.allCases.reduce(components) { result, element in
            result.flatMap { $0.split(with: element.rawValue) }
        }

        return components
    }
}

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let formula = Formula()
        let componentsOfOperands = Self.componentsByOperators(from: input)
        
        componentsOfOperands.compactMap { Double($0) }
            .map { formula.operands.enqueue(value: $0) }
        
        input.compactMap { Operator(rawValue: $0) }
            .map { formula.operators.enqueue(value: $0) }
        
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

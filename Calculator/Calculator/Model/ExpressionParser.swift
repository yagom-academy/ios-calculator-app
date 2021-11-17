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
        var temporaryArray: [String] = []
        
        for operatorSymbol in Operator.allCases {
            for element in components {
                temporaryArray += element.split(with: operatorSymbol.rawValue)
            }
            components = temporaryArray
            temporaryArray = []
        }
        
        return components
    }
}

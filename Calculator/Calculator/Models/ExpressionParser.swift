import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var formula = Formula()
        
        let operands: [Double] = componentsByOperators(from: input).compactMap { Double($0) }
        let operators: [Operator] = input.filter { !$0.isNumber }.compactMap { Operator(rawValue: $0) }
        
        formula.operands = CalculatorItemQueue(operands)
        formula.operators = CalculatorItemQueue(operators)
        
        return formula
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        let inputNoWhitespace = input.replacingOccurrences(of: " ", with: "")
        let operatorCharacters = Operator.allCases.map { $0.rawValue }
        let returnComponents = inputNoWhitespace.components(separatedBy: CharacterSet(charactersIn: String(operatorCharacters)))
        
        return returnComponents
    }
}

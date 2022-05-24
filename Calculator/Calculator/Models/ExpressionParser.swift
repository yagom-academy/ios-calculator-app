import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var formula = Formula()
        let separatedInput: [String] = componentsByOperators(from: input)
        
        let operands = separatedInput.compactMap { Double($0) }
        formula.operands = CalculatorItemQueue(operands)
        let operators = separatedInput.filter { $0.count < 2 }.compactMap { Operator(rawValue: Character($0)) }
        formula.operators = CalculatorItemQueue(operators)
        
        return formula
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        let inputNoWhitespace = input.replacingOccurrences(of: " ", with: "")
        let operatorCharacters = Operator.allCases.map { $0.rawValue }
        var returnComponents = inputNoWhitespace.components(separatedBy: CharacterSet(charactersIn: String(operatorCharacters)))
        
        let operators = inputNoWhitespace.compactMap { Operator(rawValue: $0) }.map { String($0.rawValue) }.reduce("") { $0 + $1 }
        
        var index: Int = 1
        operators.forEach {
            returnComponents.insert(String($0), at: index)
            index += 2
        }
        
        return returnComponents
    }
}

import Foundation

enum ExpressionParserError: Error {
    case includingIncorrectLetter
    case firstOrLastLetterIsNotNumber
    case incorrectCountOfNumbersAndOperators
    case failedToInitializeFormulaInstance
}

enum ExpressionParser {
    static func parse(from input: String) -> Result<Formula, ExpressionParserError> {
        guard input.hasOnlyNumberOrOperator() == true else {
            return .failure(.includingIncorrectLetter)
        }
        
        guard input.firstAndLastLetterAreNumbers() == true else {
            return .failure(.firstOrLastLetterIsNotNumber)
        }
        
        let separatedInput = ExpressionParser.componentsByOperators(from: input)
        
        var operands: [String] = []
        var operators: [String] = []
        for element in separatedInput {
            if ["+","-","/","*"].contains(element) {
                operators.append(element)
            } else {
                operands.append(element)
            }
        }
        
        guard operands.count == operators.count + 1 else {
            return .failure(.incorrectCountOfNumbersAndOperators)
        }
        
        guard let formula = Formula(operands: operands, operators: operators) else {
            return .failure(.failedToInitializeFormulaInstance)
        }
        
        return .success(formula)
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        let modifiedInput = ExpressionParser.spacingByOperators(from: input)
        
        return modifiedInput.split(with: " ")
    }
    
    static private func spacingByOperators(from input: String) -> String {
        var modifiedInput = input
        for `operator` in Operator.allCases {
            modifiedInput = modifiedInput.replacingOccurrences(of: String(`operator`.rawValue), with: " \(`operator`.rawValue) ")
        }
        
        return modifiedInput
    }
}

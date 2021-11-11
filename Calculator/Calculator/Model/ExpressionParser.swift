import Foundation

enum ExpressionParserError: Error {
    case includingIncorrectLetter
    case firstOrLastLetterIsNotNumber
    case incorrectCountOfNumbersAndOperators
}

enum ExpressionParser {
    func parse(from input: String) -> Result<Formula, ExpressionParserError> {
        guard input.hasOnlyNumberOrOperator() == true else {
            return .failure(.includingIncorrectLetter)
        }
        
        guard input.firstAndLastLetterAreNumbers() == true else {
            return .failure(.firstOrLastLetterIsNotNumber)
        }
        
        let separatedInput = componentsByOperators(from: input)
        
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
        
        //TODO: Formula must be from computed operands and operators
        return .success(Formula(operands: operands, operators: operators))

    }
    
    private func componentsByOperators(from input: String) -> [String] {
        let modifiedInput = spacingByOperators(from: input)
        
        return modifiedInput.split(with: " ")
    }
    
    private func spacingByOperators(from input: String) -> String {
        var modifiedInput = input
        for `operator` in Operator.allCases {
            modifiedInput = modifiedInput.replacingOccurrences(of: String(`operator`.rawValue), with: " \(`operator`.rawValue) ")
        }
        
        return modifiedInput
    }
}

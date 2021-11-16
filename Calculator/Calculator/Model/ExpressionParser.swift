enum ExpressionParser {
    enum ParserError: Error {
        case includingIncorrectLetter
        case firstOrLastLetterIsNotNumber
        case incorrectCountOfNumbersAndOperators
        case failedToInitializeFormulaInstance
    }
    
    static func parse(from input: String) -> Result<Formula, ExpressionParser.ParserError> {
        guard input.hasOnlyNumberOrOperator() == true else {
            return .failure(.includingIncorrectLetter)
        }
        
        guard input.firstAndLastLetterAreNumbers() == true else {
            return .failure(.firstOrLastLetterIsNotNumber)
        }
        
        let inputComponents = ExpressionParser.componentsByOperators(from: input)
                   
        let (operands, operators) = separateOperandsAndOperators(fromSingleStringArray: inputComponents)
        
        
        guard operands.count == operators.count + 1 else {
            return .failure(.incorrectCountOfNumbersAndOperators)
        }
        
        guard let formula = Formula(operands: operands, operators: operators) else {
            return .failure(.failedToInitializeFormulaInstance)
        }
        
        return .success(formula)
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        let modifiedInput = ExpressionParser.insertEmptySpaceByOperators(from: input)
        
        return modifiedInput.split(with: " ")
    }
    
    static private func insertEmptySpaceByOperators(from input: String) -> String {
        var modifiedInput = input
        for `operator` in Operator.allCases {
            modifiedInput = modifiedInput.replacingOccurrences(of: String(`operator`.rawValue), with: " \(`operator`.rawValue) ")
        }
        
        return modifiedInput
    }
    
    static private func separateOperandsAndOperators(fromSingleStringArray: [String]) -> ([String], [String]) {
        var operands: [String] = []
        var operators: [String] = []
        
        for component in fromSingleStringArray {
            if ["+","-","/","*"].contains(component) {
                operators.append(component)
            } else {
                operands.append(component)
            }
        }
        
        return (operands, operators)
    }
}

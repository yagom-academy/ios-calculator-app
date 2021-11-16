enum ExpressionParser {
    enum ParserError: Error {
        case includingIncorrectCharacter
        case firstOrLastCharacterIsNotNumber
        case incorrectCountOfNumbersAndOperators
        case failedToInitializeFormulaInstance
    }
    
    static func parse(from input: String) -> Result<Formula, ExpressionParser.ParserError> {
        guard input.hasOnlyNumberOrOperator() else {
            return .failure(.includingIncorrectCharacter)
        }
        
        guard input.firstAndLastCharacterAreNumbers() else {
            return .failure(.firstOrLastCharacterIsNotNumber)
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
        let allTargets = Operator.allStringCases
        
        allTargets.forEach {
            modifiedInput = modifiedInput.replacingOccurrences(of: $0, with: " \($0) ")
        }
        
        return modifiedInput
    }
    
    static private func separateOperandsAndOperators(fromSingleStringArray: [String]) -> ([String], [String]) {
        var operands: [String] = []
        var operators: [String] = []
        
        for component in fromSingleStringArray {
            if Operator.allStringCases.contains(component) {
                operators.append(component)
            } else {
                operands.append(component)
            }
        }
        
        return (operands, operators)
    }
}

enum ExpressionParser {
    enum ParserError: Error {
        case includingIncorrectCharacter
        case firstOrLastCharacterIsNotNumber
        case incorrectCountOfNumbersAndOperators
        case failedToInitializeFormulaInstance
    }
    
    enum StringChecker {
        static func hasOnlyNumberOrOperator(from input: String) -> Bool {
            let filteredCharacters = input.filter {
                return $0.isNumber || Operator.allCharacterCases.contains($0)
            }
            
            return input.count == filteredCharacters.count
        }
        
        static func firstAndLastCharacterAreNumbers(from input: String) -> Bool {
            guard let firstCharacter = input.first,
                  let lastCharacter = input.last else {
                return false
            }
            
            return firstCharacter.isNumber && lastCharacter.isNumber
        }
    }
    
    static func parse(from input: String) -> Result<Formula, ExpressionParser.ParserError> {
        guard StringChecker.hasOnlyNumberOrOperator(from: input) else {
            return .failure(.includingIncorrectCharacter)
        }
        
        guard StringChecker.firstAndLastCharacterAreNumbers(from: input) else {
            return .failure(.firstOrLastCharacterIsNotNumber)
        }
        
        let inputComponents = ExpressionParser.componentsByOperators(from: input)
                   
        let (operands, operators) = separateOperandsAndOperators(from: inputComponents)
        
        guard operands.count == operators.count + 1 else {
            return .failure(.incorrectCountOfNumbersAndOperators)
        }
        
        guard let formula = makeFormula(operands: operands, operators: operators) else {
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
    
    static private func separateOperandsAndOperators(from components: [String]) -> ([String], [String]) {
        var operands: [String] = []
        var operators: [String] = []
        
        components.forEach {
            if Operator.allStringCases.contains($0) {
                operators.append($0)
            } else {
                operands.append($0)
            }
        }
        
        return (operands, operators)
    }
    
    static private func makeFormula(operands: [String], operators: [String]) -> Formula? {
        
        var formula = Formula()
        
        let filteredOperands = operands.compactMap{ Double($0) }
        
        let filteredOperators = operators.filter{
            $0.count == 1
        }.compactMap {
            Operator(rawValue: Character($0))
        }
        
        guard filteredOperands.count == operands.count,
              filteredOperators.count == operators.count else {
            return nil
        }
        
        filteredOperands.forEach {
            formula.operandsQueue.enqueue($0)
        }
        filteredOperators.forEach {
            formula.operatorsQueue.enqueue($0)
        }
        
        return formula
    }
}

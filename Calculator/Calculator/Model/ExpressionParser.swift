enum ExpressionParser {
//    enum ParserError: Error {
//        case includingAbnormalCharacter
//        case firstOrLastComponentIsNotOperand
//        case incorrectCountOfOperandsAndOperators
//        case failedToInitializeFormulaInstance
//    }
    
    enum StringChecker {
        static func hasNotAbnormalCharacter(from input: String) -> Bool {
            let filteredCharacters = input.filter {
                $0.isNumber
                || Operator.allCharacterCases.contains($0)
                || $0 == " "
                || $0 == "."
            }
            
            return input.count == filteredCharacters.count
        }
        
        static func firstAndLastComponentAreOperands(from components: [String]) -> Bool {
            guard let firstComponent = components.first,
                  let _ = Double(firstComponent) else {
                      return false
                  }
            
            guard let lastComponent = components.last,
                  let _ = Double(lastComponent) else {
                      return false
                  }
            
            return true
        }
    }
}

extension ExpressionParser {
    static func parse(from input: String) throws -> Formula {
        guard StringChecker.hasNotAbnormalCharacter(from: input) else {
            throw CalculatorError.includingAbnormalCharacter
        }
        
        let inputComponents = ExpressionParser.componentsByOperators(from: input)
        
        guard StringChecker.firstAndLastComponentAreOperands(from: inputComponents) else {
            throw CalculatorError.firstOrLastComponentIsNotOperand
        }
                   
        let (operands, operators) = separateOperandsAndOperators(from: inputComponents)
        
        guard operands.count == operators.count + 1 else {
            throw CalculatorError.incorrectCountOfOperandsAndOperators
        }
        
        guard let formula = makeFormula(operands: operands, operators: operators) else {
            throw CalculatorError.failedToInitializeFormulaInstance
        }
        
        return formula
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
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
            formula.enqueueToOperandsQueue($0)
        }
        filteredOperators.forEach {
            formula.enqueueToOperatorsQueue($0)
        }
        
        return formula
    }
}

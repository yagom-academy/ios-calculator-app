enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let formula = Formula()
        let operators = componentsByOperators(from: input)
        var inputs = input
        
        operators.enumerated().forEach { (index,operatorSymbol) in
            formula.operators.enqueue(operatorSymbol)
            
            let sliceOfInput = inputs.split(with: Character(operatorSymbol))
            if sliceOfInput[0] != "" {
                formula.operands.enqueue(Double(sliceOfInput[0]) ?? 0)
            }
            
            inputs = sliceOfInput[1]
            
            if index == operators.count-1 {
                formula.operands.enqueue(Double(inputs) ?? 0)
            }
        }
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
            let operatorSymbols = Operator.allCases.map { $0.rawValue
            }
            let operators = input.filter { operatorSymbols.contains($0) }.map { String($0) }
            return operators
    }
}

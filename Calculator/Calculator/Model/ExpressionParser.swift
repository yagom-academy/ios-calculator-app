enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operatorQueue = CalculatorItemQueue(
            elements: input.compactMap { Operator(rawValue: $0) }
        )
        
        let operandQueue = CalculatorItemQueue(
            elements: componentsByOperators(from: input).compactMap { Double($0) }
        )
        
        return Formula(operands: operandQueue, operators: operatorQueue)
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        var results: [String] = [input]
        
        Operator.allCases.forEach { `operator` in
            results = results.map {
                $0.split(with: `operator`.rawValue)
            }.flatMap { $0 }
        }
        
        return results
    }
}



enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operands: CalculatorItemQueue<Double>
        let operators: CalculatorItemQueue<Operator>
        let operatorFilter = input.compactMap { Operator(rawValue: $0) }
        let operandsFilter = componentsByOperators(from: input).compactMap { Double($0) }
        
        operators = CalculatorItemQueue(enqueueStack: operatorFilter)
        operands = CalculatorItemQueue(enqueueStack: operandsFilter)
        
        return Formula(operands: operands , operators: operators )
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var result: [String] = [input]
        
        Operator.allCases.forEach { operatorElement in
            result = result.map { $0.split(with: operatorElement.rawValue) }.flatMap { $0 }
        }
        return result
    }
    
}

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Operator>()
        
        input.compactMap { Operator(rawValue: $0) }.forEach { operators.enqueue(element: $0) }
        componentsByOperators(from: input).compactMap { Double($0) }.forEach { operands.enqueue(element: $0) }
        
        return Formula(operands: operands , operators: operators )
        
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var result: Array<String> = [input]
        
        Operator.allCases.forEach { Operator in
            result = result.map{ $0.split(with: Operator.rawValue) }.flatMap { $0 }
        }
        
        return result
    }
    
}

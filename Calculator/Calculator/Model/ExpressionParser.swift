enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var formula = Formula()
        let splitedInput = componentByOperators(from: input).enumerated()
        
        splitedInput.filter { $0.0 % 2 == 0 }
            .compactMap { Double($0.1) }
            .forEach { formula.operands.enqueue($0) }
        
        splitedInput.filter { $0.0 % 2 == 1 }
            .compactMap { Operator(rawValue: Character($0.1)) }
            .forEach { formula.operators.enqueue($0) }
       
        return formula
    }
    
    private static func componentByOperators(from input: String) -> [String] {
       var doubledString: [[String]] = [[]]
       var result: [String] = [input]
        
        Operator.allCases.forEach { opr in
            result.forEach {
                doubledString.append($0.split(with: opr.symbol))
            }
           result = doubledString.flatMap { $0 }
           doubledString.removeAll()
       }
        
        return result
    }
}

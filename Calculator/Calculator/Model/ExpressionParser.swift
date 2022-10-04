enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var formula: Formula = Formula()
        let componentsResult: [String] = componentsByOperators(from: input)
        
        componentsResult.forEach {
            if let number: Double = Double($0) {
                formula.operands.enqueue(number)
            } else if let currentOperator: Operator = Operator.init(rawValue: Character($0)) {
                formula.operators.enqueue(currentOperator)
            }
        }
        
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var componentsResult: [String] = [input]
        
        Operator.allCases.forEach { (targetOperator) in
            componentsResult = componentsResult.reduce(into: [String]()) {
                if $1.count != 1 {
                    $0 += $1.split(with: targetOperator.rawValue)
                } else {
                    $0.append($1)
                }
            }
        }
        
        return componentsResult
    }
}

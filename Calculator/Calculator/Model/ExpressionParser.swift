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
        
        return Formula()
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var componentsResult: [String] = []
        var calculateData: String = ""
        
        input.forEach {
            if Operator.init(rawValue: $0) != nil {
                if calculateData == "" {
                    calculateData.append($0)
                } else {
                    componentsResult.append(calculateData)
                    componentsResult.append(String($0))
                    calculateData = ""
                }
            } else {
                calculateData.append($0)
            }
        }
        
        if calculateData != "" {
            componentsResult.append(calculateData)
        }
        
        return componentsResult
    }
}

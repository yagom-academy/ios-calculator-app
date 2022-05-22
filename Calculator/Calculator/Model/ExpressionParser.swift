enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let formula = Formula()
        let compoents = componentsByOperators(from: input)
        let operands = compoents.filter {
            $0.allSatisfy{ $0.isNumber }
        }
        let operators = compoents.filter {
            !$0.allSatisfy{ $0.isNumber }
        }
        
        operands.forEach {
            formula.operands.enqueue(Double($0) ?? 0)
        }
        operators.forEach {
            formula.operators.enqueue($0)
        }
        
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let operatorSybols = Operator.allCases.map { $0.rawValue
        }
        var count = 0
        let items = input.reduce([String]()) { (result, element) -> [String] in
            if operatorSybols.contains(element) && count > 1 {
                let joinedResult = [result.joined()]
                count = 0
                return joinedResult + [String(element)]
            }

            count += 1
            return result + [String(element)]
        }

        return items
    }
}

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operands = CalculatorItemQueue<Double>()
        let operators = CalculatorItemQueue<Operator>()
        let compoents = componentsByOperators(from: input)
        
        compoents.compactMap {Double($0)}.forEach { operands.enqueue($0) }
        
        compoents.filter { $0.count == 1 }.compactMap {
            Operator(rawValue: Character($0))
        }.forEach { operators.enqueue($0)
        }
        
        let formula = Formula(operands: operands, operators: operators)
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var result: [String] = [input]
        
        Operator.allCases.forEach { opr in
            result = result.reduce(into: [] ) {
                $0.append($1.split(with: opr.symbol))
            }.flatMap { $0 }
        }
        
        return result
    }
}

import CoreGraphics
enum ExpressionParser {
    static func parse(from input: String) throws -> Formula {
        let splitedInput = componentByOperators(from: input)
        
        try checkWrongFormulaError(for: splitedInput)
        
        let operands = splitedInput.compactMap { Double($0) }
        let operators = splitedInput.filter { $0.count == 1 }.compactMap { Operator(rawValue: Character($0)) }
        
        return Formula(operands: CalculatorItemQueue<Double>.init(list: operands), operators: CalculatorItemQueue<Operator>.init(list: operators))
    }
    
    private static func checkWrongFormulaError(for input: [String]) throws {
        guard input.count > 1 else { throw CalculatorError.wrongFormula }
            
        for index in 0...(input.count / 2) {
            if Double(input[index * 2]) == nil {
                throw CalculatorError.wrongFormula
            }
        }
    }
    
    private static func componentByOperators(from input: String) -> [String] {
        var result: [String] = [input]
        
        Operator.allCases.forEach { opr in
            result = result.reduce(into: [] ) {
                $0.append($1.split(with: opr.symbol))
            }.reduce([]) { $0 + $1 }
        }
        
        return result
    }
}

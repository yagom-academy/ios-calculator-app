import CoreGraphics
enum ExpressionParser {
    static func parse(from input: String) throws -> Formula {
        let splitedInput = componentByOperators(from: input)

        for index in 0...splitedInput.count/2 {
            guard Double(splitedInput[index*2]) != nil else {
                throw CalculatorError.wrongFormula
            }
        }
                
        let operands = splitedInput.compactMap { Double($0) }
        let operators = splitedInput.filter { $0.count == 1 }.compactMap { Operator(rawValue: Character($0)) }
        
        guard operands.count * operators.count != 0 else {
            throw CalculatorError.wrongFormula
        }
                
        let operandQueue = CalculatorItemQueue<Double>.init(list: operands)
        let operatorQueue = CalculatorItemQueue<Operator>.init(list: operators)
        
        return Formula(operands: operandQueue, operators: operatorQueue)
    }
    
    private static func componentByOperators(from input: String) -> [String] {
        var result: [String] = [input]
        
        Operator.allCases.forEach { opr in
            let doubledString = result.reduce(into: [] ) {
                $0.append($1.split(with: opr.symbol))
            }
            result = doubledString.flatMap { $0 }
        }
        
        return result
    }
}

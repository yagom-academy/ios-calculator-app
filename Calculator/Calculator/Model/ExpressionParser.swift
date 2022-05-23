enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let splitedInput = componentByOperators(from: input)
        let operands = splitedInput.compactMap { Double($0) }
        let operators = splitedInput.filter { $0.count == 1 }.compactMap { Operator(rawValue: Character($0)) }
        let operandQueue = CalculatorItemQueue<Double>.init(list: operands)
        let operatorQueue = CalculatorItemQueue<Operator>.init(list: operators)
        
        return Formula(operands: operandQueue, operators: operatorQueue)
    }
    
    private static func componentByOperators(from input: String) -> [String] {
       var doubledString: [[String]] = []
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

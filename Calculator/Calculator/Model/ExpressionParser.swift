enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operands = componentsByOperators(from: input)
                        .compactMap{ Double($0) }
        
        let operators = input.compactMap{ Operator(rawValue: $0) }
        
        return Formula(operators: CalculatorItemQueue(operators), operands: CalculatorItemQueue(operands))
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        var inputArray = [input]
        var tempArray: [String] = []
        Operator.allCases.forEach { `operator` in
            for input in inputArray {
                tempArray += input.split(with: `operator`.rawValue)
            }
            inputArray = tempArray
            tempArray.removeAll()
        }
        return inputArray
    }
}

fileprivate extension String {
    func split(with target: Character) -> [String] {
        var strArray: [String] = []
        var num: String = ""
        self.forEach {
            if $0 != target {
                num = num + String($0)
            } else {
                strArray.append(num)
                num.removeAll()
            }
        }
        strArray.append(num)
        return strArray
    }
}

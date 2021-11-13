enum ExpressionParser {
    func parse(from input: String) -> Formula {
        let splitInput = componentsByOperators(from: input)
        let operands = splitInput.compactMap { Double($0) }
        let operators = splitInput.compactMap { Operator(rawValue: Character($0)) }
        let formula = Formula(operands: CalculatorItemQueue(operands),
                              operators: CalculatorItemQueue(operators))
        return formula
    }

    private func componentsByOperators(from input: String) -> [String] {
        let operators = Operator.allCases.map { $0.rawValue }
        var result: [String] = [input]
        for char in operators {
            result = result.flatMap { $0.split(with: char) }
        }
        return result
    }
}

extension String {
    func split(with target: Character) -> [String] {
        var result: [String] = []
        var number = ""
        for char in self {
            if char == target {
                result.append(number)
                result.append(String(char))
                number = ""
            } else {
                number += String(char)
            }
        }
        
        if number.isEmpty == false {
            result.append(number)
        }
        return result
    }
}

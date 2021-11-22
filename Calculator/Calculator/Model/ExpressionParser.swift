enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let splitInput = componentsByOperators(from: input)
        let operands = splitInput.compactMap { Double($0) }
        let operators = input.compactMap { Operator(rawValue: $0) }
        let formula = Formula(operands: operands, operators: operators)
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let operators = Operator.allCases.map { $0.rawValue }
        var result: [String] = [input]
        for `operator` in operators {
            result = result.flatMap { $0.split(with: `operator`) }
        }
        return result
    }
}

fileprivate extension String {
    func split(with target: Character) -> [String] {
        var result: [String] = []
        var number = ""
        for char in self {
            if char == target {
                result.append(number)
                result.append(String(char))
                number.removeAll()
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

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var formula = Formula()
        let separatedInput: [String] = componentsByOperators(from: input)
        
        separatedInput.forEach {
            if let operand = Double($0) {
                formula.operands.push(element: operand)
            } else {
                guard let `operator` = Operator(rawValue: Character($0)) else { return }
                formula.operators.push(element: `operator`)
            }
        }
        
        return formula
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        let inputNoWhitespace = input.replacingOccurrences(of: " ", with: "")
        var returnComponents = inputNoWhitespace.components(separatedBy: ["+", "-", "/", "*"])
        let operators = inputNoWhitespace.filter { Operator(rawValue: $0) != nil ? true : false }
        
        var index: Int = 1
        operators.forEach {
            returnComponents.insert(String($0), at: index)
            index += 2
        }
        
        return returnComponents
    }
}

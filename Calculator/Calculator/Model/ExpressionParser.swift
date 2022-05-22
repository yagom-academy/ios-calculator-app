enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let formula = Formula()
        let operators = componentsByOperators(from: input)
        var count = 0
        let operands = input.reduce("") { (result, element) -> String in
            if operators.contains(String(element)) && count > 0 {
                let joinedResult = result + String(element)
                let operand = Double(joinedResult.split(with: element)[0]) ?? 0
                print(operand)
                formula.operands.enqueue(operand)
                count = 0
                return ""
            }
            
            if element.isNumber {
                count += 1
            } else {
                count = 0
            }
            
            return result + String(element)
        }
        
        formula.operands.enqueue(Double(operands) ?? 0)
        
        operators.forEach {
            formula.operators.enqueue($0)
        }
        
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
            let operatorSybols = Operator.allCases.map { $0.rawValue
            }
            let operators = input.filter { operatorSybols.contains($0) }.map { String($0) }
            return operators
    }
}

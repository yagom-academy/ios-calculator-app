enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let formula = Formula()
        let compoents = componentsByOperators(from: input)
        
        compoents.forEach { item in
            if item.allSatisfy({ $0.isNumber }) {
                formula.operands.enqueue(Double(item) ?? 0)
            } else {
                formula.operators.enqueue(item)
            }
        }
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let operatorSybols = Operator.allCases.map { $0.rawValue
        }
        var count = 0
        let items = input.reduce([String]()) { (result, element) -> [String] in
            if operatorSybols.contains(element) && count > 1 {
                let joinedResult = result.joined() + String(element)
                count = 0
                return joinedResult.split(with: element)
            }
            
            if element.isNumber {
                count += 1
            } else {
                count = 0
            }
            
            return result + [String(element)]
        }
        return items
    }
}

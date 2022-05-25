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
        let operatorSymbols = Operator.allCases.map { $0.symbol }
        var items = [String]()
        var splitedInput = input
        var count = 0
        
        input.forEach { element in
            var joinedResult = [""]
            let target = Character(String(element))
            
            if element.isNumber {
                count += 1
            }
            
            if operatorSymbols.contains(element) && count > 0 {
                joinedResult = splitedInput.split(with: target)
                items = items + [joinedResult[0]] + [String(element)]
                splitedInput = joinedResult[1]
                count = 0
            }
            
            if element == input.last {
                items += [splitedInput]
            }
        }
        
        print(items)
        return items
    }
}

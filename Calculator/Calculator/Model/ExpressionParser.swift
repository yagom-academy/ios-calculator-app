enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operands = CalculatorItemQueue<Double>()
        let operators = CalculatorItemQueue<Operator.RawValue>()
        let compoents = componentsByOperators(from: input)
        
        compoents.forEach { item in
            if item.allSatisfy({ $0.isNumber }) {
                operands.enqueue(Double(item) ?? 0)
            } else {
                operators.enqueue(Character(item))
            }
        }
        
        let formula = Formula(operands: operands, operators: operators)
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let operatorSymbols = Operator.allCases.map { $0.symbol }
        var items = [String]()
        var splitedInput = input
        var count = 0
        
        input.forEach { element in
            let target = Character(String(element))
            
            if element.isNumber {
                count += 1
            }
            
            if operatorSymbols.contains(element) && count > 0 {
                let operand = splitedInput.split(with: target)[0]
                let remainedFormula = splitedInput.split(with: target)[1]
                
                items = items + [operand] + [String(element)]
                splitedInput = remainedFormula
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

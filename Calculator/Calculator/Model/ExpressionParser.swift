enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operands = CalculatorItemQueue<Double>()
        let operators = CalculatorItemQueue<Operator>()
        let compoents = componentsByOperators(from: input)
        
        compoents.compactMap {Double($0)}.forEach { operands.enqueue($0) }
        
        compoents.compactMap {
            Operator(rawValue: Character($0))
        }.forEach { operators.enqueue($0)
        }
        
        let formula = Formula(operands: operands, operators: operators)
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let operatorSymbols = Operator.allCases.map { $0.symbol }
        var items = [String]()
        var splitedInput = input
        var count = 0
        var sign: Character = " "
        
        input.forEach { element in
            let target = Character(String(element))
            
            if element.isNumber {
                count += 1
            }
            
            if operatorSymbols.contains(element) && count > 0 {
                var operand = splitedInput.split(with: target)[0]
                let remainedFormula = splitedInput.split(with: target)[1]
                
                if sign != " " {
                    operand = String(sign) + operand
                    sign = " "
                }
                
                items = items + [operand] + [String(element)]
                splitedInput = remainedFormula
                count = 0
            } else if operatorSymbols.contains(element) && count == 0 {
                sign = element
            }
        }
        items += [splitedInput]
        return items
    }
}

import Foundation

enum ExpressionParser {
    public static func parse(from input: String) -> Formula {
        var operands: CalculatorItemQueue = CalculatorItemQueue<Double>()
        var operators: CalculatorItemQueue = CalculatorItemQueue<Character>()
        let operatorPool = Operator.allCases.map({ String($0.rawValue) })
        
        let convertedInputArray = componentsByOperators(from: input)
        
        convertedInputArray.compactMap({ Double($0) }).forEach({
            operands.enqueue(element: $0)
        })
        
        convertedInputArray.filter({ operatorPool.contains($0) }).compactMap({ Character($0) }).forEach({
            operators.enqueue(element: $0)
        })
        
        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}

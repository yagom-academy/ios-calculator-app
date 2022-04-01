
import Foundation

enum ExpressionParser {
    public static func parse(from input: String) -> Formula {
        var operands: CalculatorItemQueue = CalculatorItemQueue<Double>()
        var operators: CalculatorItemQueue = CalculatorItemQueue<Operator>()
        let operatorPool = Operator.allCases.map({ String($0.rawValue) })
        
        let componentsInputByOperators = componentsByOperators(from: input)
        
        componentsInputByOperators.compactMap({ Double($0) }).forEach({
            operands.enqueue($0)
        })
        
        componentsInputByOperators.filter({ operatorPool.contains($0) }).compactMap({ Character($0) }).forEach({
                guard let operatorItem = Operator.init(rawValue: $0) else { return }
                operators.enqueue(operatorItem)
        })
        
        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}

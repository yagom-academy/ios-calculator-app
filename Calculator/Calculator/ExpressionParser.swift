import Foundation

enum ExpressionParser {
    public func parse(from input: String) -> Formula {
        var operands: CalculatorItemQueue = CalculatorItemQueue<Double>()
        var operators: CalculatorItemQueue = CalculatorItemQueue<Character>()
        let operatorPool:[Character] = ["+", "-", "/", "*"]
        
        // 연산자(operators)와 피연산자(operands)를 분리해서 각각 큐에 담은 Formula return
        let operandArray = componentsByOperators(from: input).compactMap({ Double($0) })
        operandArray.forEach({
            operands.enqueue(element: Double($0))
        })
        
        let operatorArray = input.filter({ operatorPool.contains($0) })
        operatorArray.forEach({
            operators.enqueue(element: $0)
        })
        
        return Formula(operands: operands, operators: operators)
    }
    
    private func componentsByOperators(from input: String) -> [String] {
        return input.components(separatedBy: ["+", "-", "/", "*"])
    }
}

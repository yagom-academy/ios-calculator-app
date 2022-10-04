//  Created by Aejong on 2022/09/27

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operands = CalculatorItemQueueByLinkedList<Double>()
        var operators = CalculatorItemQueueByLinkedList<Operator>()
        
        componentsByOperator(from: input).compactMap { Double($0) }.forEach { operands.enqueue($0) }
        
        input.compactMap { Operator(rawValue: $0) }.forEach { operators.enqueue($0) }
        
        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperator(from input: String) -> [String] {
        var inputString: String = input
        let whiteSpace: String = " "
        
        Operator.allCases.forEach {
            inputString = inputString.replacingOccurrences(of: String($0.rawValue), with: whiteSpace)
        }
        
        return inputString.split(with: Character(whiteSpace))
    }
}

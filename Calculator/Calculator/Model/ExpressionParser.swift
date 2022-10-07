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
        
        Operator.allCases.forEach {
            inputString = inputString.replacingOccurrences(of: String($0.rawValue), with: NameSpace.whiteSpace)
        }
        
        return inputString.split(with: Character(NameSpace.whiteSpace))
    }
}
#imageLiteral(resourceName: "붙여넣은_이미지_2022__10__7__오후_5_54.png")

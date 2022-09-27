//  Created by Aejong on 2022/09/27

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operands = CalculatorItemQueueByLinkedList<Double>()
        var operators = CalculatorItemQueueByLinkedList<Operator>()
        let operandsArray: [Double] = componentsByOperator(from: input).compactMap { Double($0) }
        let operatorsArray: [Operator] = input.compactMap { Operator(rawValue: $0) }
        
        for singleOperand in operandsArray {
            operands.enqueue(singleOperand)
        }
        
        for singleOperator in operatorsArray {
            operators.enqueue(singleOperator)
        }
        
        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperator(from input: String) -> [String] {
        var inputString: String = input
        
        for caseOperator in Operator.allCases {
            inputString = inputString.replacingOccurrences(of: "\(caseOperator.rawValue)", with: " ")
        }
        
        return inputString.split(with: " ")
    }
}

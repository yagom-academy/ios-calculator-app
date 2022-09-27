//  Created by Aejong on 2022/09/27

enum ExpressionParser {
    func parse(from input: String) -> Formula {
        return Formula(operands: CalculatorItemQueueByLinkedList<Double>.init(), operators: CalculatorItemQueueByLinkedList<Operator>.init())
    }
    
    private func componentsByOperator(from input: String) -> [String] {
        var inputString: String = input
        
        for caseOperator in Operator.allCases {
            inputString = inputString.replacingOccurrences(of: "\(caseOperator.rawValue)", with: " ")
        }

        return inputString.split(with: " ")
    }
}

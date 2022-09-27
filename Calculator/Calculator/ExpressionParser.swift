//  Created by Aejong on 2022/09/27

enum ExpressionParser {
    func parse(from input: String) -> Formula {
        return Formula(operands: CalculatorItemQueueByLinkedList<Double>.init(), operators: CalculatorItemQueueByLinkedList<Operator>.init())
    }
    
    private func componentsByOperator(from input: String) -> [String] {
        return [""]
    }
}

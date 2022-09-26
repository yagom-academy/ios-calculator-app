//  Created by Aejong on 2022/09/27

enum ExpressionParser {
    func parse(from input: String) -> Formula {
        return Formula(operands: CalculatorItemQueueByLinkedList<Any>.init(), operators: CalculatorItemQueueByLinkedList<Any>.init())
    }
    
    private func componentsByOperator(from input: String) -> [String] {
        return [""]
    }
}

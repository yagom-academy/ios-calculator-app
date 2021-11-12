import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operatorEnumArray = Operator.allCases.map { String($0.rawValue) }
        let inputCharacters = Array(input).map { String($0) }
        let inputOperator = inputCharacters.filter { operatorEnumArray.contains($0) == true }
        let inputOperands = componentsByOperators(from: input)
        
        let formula = Formula()
        for operandIndex in 0...inputOperands.count - 1 {
            formula.operands.insertToQueue(Double(inputOperands[operandIndex]) ?? 0)
        }
        for operatorIndex in 0...inputOperator.count - 1 {
            formula.operators.insertToQueue(Character(inputOperator[operatorIndex]))
        }
        return formula
    }

    private static func componentsByOperators(from input: String) -> [String] {
        var splitedWithTarget: [String]
        var joinedString = input
        for operatorCase in Operator.allCases {
            splitedWithTarget = joinedString.split(with: operatorCase.rawValue)
            joinedString = splitedWithTarget.joined(separator: " ")
        }
        let inputOperands = joinedString.components(separatedBy: " ")
        return inputOperands
    }
}

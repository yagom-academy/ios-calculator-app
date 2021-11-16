import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let operatorEnumArray = Operator.allCases.map { String($0.rawValue) }
        let inputCharacters = Array(input).map { String($0) }
        let inputOperator = inputCharacters.filter { operatorEnumArray.contains($0) == true }
        let inputOperands = componentsByOperators(from: input)
        
        let formula = Formula()
        for inputOperands in inputOperands {
            formula.operands.insertToQueue(Double(inputOperands) ?? 0)
        }
        for inputOperator in inputOperator {
            formula.operators.insertToQueue(Character(inputOperator))
        }

        return formula
    }

    private static func componentsByOperators(from input: String) -> [String] {
        var arrayOfBeingSplit: [String]
        var stringOfSplitTarget = input
        for operatorCase in Operator.allCases {
            arrayOfBeingSplit = stringOfSplitTarget.split(with: operatorCase.rawValue)
            stringOfSplitTarget = arrayOfBeingSplit.joined(separator: " ")
        }
        let inputOperands = stringOfSplitTarget.components(separatedBy: " ")
        return inputOperands
    }
}

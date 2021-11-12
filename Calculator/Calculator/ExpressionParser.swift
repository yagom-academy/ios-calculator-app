import Foundation

enum ExpressionParser {
    func parse(from input: String) -> Formula {
        let operatorEnumArray = Operator.allCases.map { String($0.rawValue) }
        let inputCharacters = Array(input).map { String($0) }
        let inputOperator = inputCharacters.filter { operatorEnumArray.contains($0) == true }
        let inputOperands = componentsByOperators(from: input)
        
        let formula = Formula()
        for operandIndex in 0...inputOperands.count {
            formula.operands.insertToQueue(Double(inputOperands[operandIndex]) ?? 0)
        }
        for operatorIndex in 0...inputOperator.count {
            formula.operators.insertToQueue(Character(inputOperator[operatorIndex]))
        }
        return formula
    }

    private func componentsByOperators(from input: String) -> [String] {
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

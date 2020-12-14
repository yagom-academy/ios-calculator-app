struct BinaryExpressionAnalyzer {
    func convertExpressionToToken(expression: String) -> [BinaryToken]? {
        let splitString = expression.split(separator: " ")
        let binaryOperators: [String] = {
            var operatorRawValues = [String]()
            BinaryOperator.Operator.allCases.forEach {
                operatorRawValues.append($0.rawValue)
            }
            return operatorRawValues
        }()
        var tokenExpression = [BinaryToken]()
        
        for element in splitString {
            let stringElement = String(element)
            if let binary = Int(stringElement, radix: 2) {
                tokenExpression.append(BinaryOperand(value: binary))
            } else if binaryOperators.contains(stringElement) {
                guard let binaryOperator = BinaryOperator.convertStringOperatorToBinaryOperator(operator: stringElement) else {
                    return nil
                }
                tokenExpression.append(BinaryOperator(value: binaryOperator, priority: BinaryOperator.getOperatorPrecedence(operator: binaryOperator)))
            }
        }
        
        return tokenExpression
    }
}

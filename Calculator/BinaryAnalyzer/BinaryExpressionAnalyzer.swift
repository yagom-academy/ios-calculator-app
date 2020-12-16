struct BinaryExpressionAnalyzer {
    var tokenExpression = [BinaryToken]()
    
    mutating func convertExpressionToToken(expression: String) -> [BinaryToken]? {
        let splitString = expression.split(separator: " ")
        let binaryOperators: [String] = {
            var operatorRawValues = [String]()
            BinaryOperator.Operator.allCases.forEach {
                operatorRawValues.append($0.rawValue)
            }
            return operatorRawValues
        }()
        
        for element in splitString {
            let stringElement = String(element)
            if let binary = Int(stringElement, radix: 2) {
                tokenExpression.append(BinaryOperand(value: binary))
            } else if binaryOperators.contains(stringElement) {
                appendOperatorToken(stringElement)
            }
        }
        
        return tokenExpression
    }
    
    mutating func appendOperatorToken(_ stringElement: String) {
        guard let binaryOperator = BinaryOperator.convertStringOperatorToBinaryOperator(operator: stringElement) else {
            return
        }
        tokenExpression.append(BinaryOperator(value: binaryOperator, priority: BinaryOperator.getOperatorPrecedence(operator: binaryOperator)))
    }
}

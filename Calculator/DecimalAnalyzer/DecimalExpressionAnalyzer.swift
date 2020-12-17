struct DecimalExpressionAnalyzer {
    var tokenExpression = [DecimalToken]()
    
    mutating func convertExpressionToToken(expression: String) -> [DecimalToken]? {
        let splitString = expression.split(separator: " ")
        let arithmeticOperators: [String] = {
            var operatorRawValues = [String]()
            DecimalOperator.Arithmetic.allCases.forEach {
                operatorRawValues.append($0.rawValue)
            }
            return operatorRawValues
        }()
        
        for element in splitString {
            let stringElement = String(element)
            if let integer = Int(stringElement) {
                tokenExpression.append(IntegerOperand(value: integer))
            } else if let realNumber = Double(stringElement) {
                tokenExpression.append(RealNumberOperand(value: realNumber))
            } else if arithmeticOperators.contains(stringElement) {
                appendOperatorToken(stringElement)
            }
        }
        
        return tokenExpression
    }
    
    mutating func appendOperatorToken(_ stringElement: String) {
        guard let arithmeticOperator = DecimalOperator.convertStringOperatorToArithmeticOperator(operator: stringElement) else {
            return
        }
        tokenExpression.append(DecimalOperator(value: arithmeticOperator, priority: DecimalOperator.getOperatorPrecedence(operator: arithmeticOperator)))
    }
}

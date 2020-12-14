struct BinaryTokenAnalyzer {
    func convertInfixToPostfix(tokenExpression: [BinaryToken]) -> [BinaryToken]? {
        var postfixExpression = [BinaryToken]()
        var temporaryOperatorStorage = Stack<BinaryOperator>()
        
        for token in tokenExpression {
            switch token {
            case let binaryToken as BinaryOperand:
                postfixExpression.append(binaryToken)
            case let operatorToken as BinaryOperator:
                if temporaryOperatorStorage.isEmpty {
                    temporaryOperatorStorage.push(element: operatorToken)
                } else {
                    while let previousStoredOperatorToken = temporaryOperatorStorage.peek(), previousStoredOperatorToken >= operatorToken {
                        postfixExpression.append(previousStoredOperatorToken)
                        _ = temporaryOperatorStorage.pop()
                    }
                    temporaryOperatorStorage.push(element: operatorToken)
                }
            default:
                return nil
            }
        }
        
        while let previousStoredOperatorToken = temporaryOperatorStorage.pop() {
            postfixExpression.append(previousStoredOperatorToken)
        }
        
        return postfixExpression
    }
}

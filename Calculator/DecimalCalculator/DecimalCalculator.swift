struct DecimalCalculator {
    func calculate(postfixTokenExpression: [DecimalToken]) -> DecimalToken? {
        var temporaryOperandStorage = Stack<DecimalToken>()

        for token in postfixTokenExpression {
            switch token {
            case let integerOperandToken as IntegerOperand:
                temporaryOperandStorage.push(element: integerOperandToken)
            case let realNumberOperandToken as RealNumberOperand:
                temporaryOperandStorage.push(element: realNumberOperandToken)
            case let operatorToken as DecimalOperator:
                guard let secondToken = temporaryOperandStorage.pop() else {
                    return nil
                }
                guard let firstToken = temporaryOperandStorage.pop() else {
                    return nil
                }
                var intermediateCalculationToken: DecimalToken?
                
                if let secondOperand = secondToken as? IntegerOperand {
                    if let firstOperand = firstToken as? IntegerOperand {
                        let newValue = checkIntegerMaxLength(value: DecimalCalculation.calculate(firstOperand.value, secondOperand.value, operatorToken.value))
                        intermediateCalculationToken = IntegerOperand(value: newValue)
                    } else if let firstOperand = firstToken as? RealNumberOperand {
                        let newValue = checkRealNumberMaxLength(value: DecimalCalculation.calculate(firstOperand.value, secondOperand.value, operatorToken.value))
                        intermediateCalculationToken = RealNumberOperand(value: newValue)
                    }
                } else if let secondOperand = secondToken as? RealNumberOperand {
                    if let firstOperand = firstToken as? IntegerOperand {
                        let newValue = checkRealNumberMaxLength(value: DecimalCalculation.calculate(firstOperand.value, secondOperand.value, operatorToken.value))
                        intermediateCalculationToken = RealNumberOperand(value: newValue)
                    } else if let firstOperand = firstToken as? RealNumberOperand {
                        let newValue = checkRealNumberMaxLength(value: DecimalCalculation.calculate(firstOperand.value, secondOperand.value, operatorToken.value))
                        intermediateCalculationToken = RealNumberOperand(value: newValue)
                    }
                }
                
                guard let intermediateCalculationResult = intermediateCalculationToken else {
                    return nil
                }
                temporaryOperandStorage.push(element: intermediateCalculationResult)
            default:
                return nil
            }
        }
        
        guard let calculationResultToken = temporaryOperandStorage.pop() else {
            return nil
        }
        return calculationResultToken
    }
    
    private func checkIntegerMaxLength(value: Int) -> Int {
        var newValue = value
        
        if (value > 0) {
            let positiveIntegerLimitSize = 9
            newValue = resizeIntegerLength(value, positiveIntegerLimitSize)
        } else if (value < 0) {
            let negativeIntegerLimitSize = 10
            newValue = resizeIntegerLength(value, negativeIntegerLimitSize)
        }
        
        return newValue
    }
    
    private func resizeIntegerLength(_ value: Int, _ limitLength: Int) -> Int {
        var newValue = value
        let valueToString = String(value)
        let valueLength = valueToString.count
        
        if (value > 0) {
            if (getIntegerLengthSize(value) > limitLength) {
                if let slicedValue = Int(valueToString[valueToString.index(valueToString.startIndex, offsetBy: valueLength - limitLength)..<valueToString.endIndex]){
                    newValue = slicedValue
                }
            }
        }
        
        return newValue
    }
    
    private func getIntegerLengthSize(_ value: Int) -> Int {
        String(value).count
    }
    
    private func checkRealNumberMaxLength(value: Double) -> Double {
        var newValue = value
        
        if (value > 0) {
            let positiveRealNumberLimitSize = 10
            newValue = resizeRealNumberLength(value, positiveRealNumberLimitSize)
        } else if (value < 0) {
            let negativeIntegerLimitSize = 11
            newValue = resizeRealNumberLength(value, negativeIntegerLimitSize)
        }
        
        return newValue
    }
    
    private func resizeRealNumberLength(_ value: Double, _ limitLength: Int) -> Double {
        var newValue = value
        
        if (getRealNumberLengthSize(value) > limitLength) {
            let valueToString = String(value)
            if let slicedValue = Double(valueToString[valueToString.startIndex..<valueToString.index(valueToString.startIndex, offsetBy: limitLength)]) {
                newValue = slicedValue
            }
        }
        
        return newValue
    }
    
    private func getRealNumberLengthSize(_ value: Double) -> Int {
        String(value).count
    }
}

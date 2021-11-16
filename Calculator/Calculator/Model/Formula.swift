struct Formula {
    var operands = CalculatorItemQueue()
    var operators = CalculatorItemQueue()

    func result() -> Double {
        let operandsArray: [Double] = operands.allOperands()
        let operatorsArray: [Operator] = operators.allOperators()
        
        guard operandsArray.count > 0 else {
            return 0
        }
        
        var result = operandsArray[0]
        for index in 0..<operatorsArray.count {
            result = operatorsArray[index].calculate(lhs: result, rhs: operandsArray[index+1])
        }

        return result
    }
}

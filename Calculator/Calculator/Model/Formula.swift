struct Formula {
    var operandsQueue = CalculatorItemQueue()
    var operatorsQueue = CalculatorItemQueue()

    func result() -> Double {
        let operands: [Double] = operandsQueue.allOperands()
        let operators: [Operator] = operatorsQueue.allOperators()
        
        guard operands.count > 0 else {
            return 0
        }
        
        var result = operands[0]
        for index in 0..<operators.count {
            result = operators[index].calculate(lhs: result, rhs: operands[index+1])
        }

        return result
    }
}

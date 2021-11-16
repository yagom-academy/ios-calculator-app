struct Formula {
    var operandsQueue = CalculatorItemQueue()
    var operatorsQueue = CalculatorItemQueue()

    func result() -> Double {
        let operands: [Double] = operandsQueue.allOperands()
        let operators: [Operator] = operatorsQueue.allOperators()
        
        guard var result = operands.first else {
            return 0
        }
        
        for (index, `operator`) in operators.enumerated() {
            guard index+1 < operands.count else { break }
            
            let operand = operands[index+1]
            result = `operator`.calculate(lhs: result, rhs: operand)
        }

        return result
    }
}

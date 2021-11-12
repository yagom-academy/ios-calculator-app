struct Formula {
    var operands: CalculatorItemQueue
    var operators: CalculatorItemQueue
    
    init() {
        self.operands = CalculatorItemQueue()
        self.operators = CalculatorItemQueue()
    }
    
    init?(operands: [String], operators: [String]) {
        self.operands = CalculatorItemQueue()
        self.operators = CalculatorItemQueue()
        
        for operand in operands {
            guard let operand = Double(operand) else {
                return nil
            }
            
            self.operands.enqueue(operand)
        }
        
        for `operator` in operators {
            guard let `operator` = `operator`.first else {
                return nil
            }
            
            guard let `operator` = Operator(rawValue: `operator`) else {
                return nil
            }
            
            self.operators.enqueue(`operator`)
        }
    }
    
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

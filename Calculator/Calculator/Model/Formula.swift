struct Formula {
    typealias queue = CalculatorItemQueue
    
    private(set) var operands: queue<Double>
    private(set) var operators: queue<Operator>
    
    init(operands: queue<Double> = queue<Double>(), operators: queue<Operator> = queue<Operator>()){
        self.operands = operands
        self.operators = operators
    }
    
    func result() throws -> Double {
        guard let start = operands.dequeue() else {
            return 0.0
        }
        
        let errorNumber = CalculatorError.dividedByZero.errorCaseNumber
        let result = try operands.displayItems().reduce(start) { partialResult, operand in
            guard let operatorSymbol = operators.dequeue() else {
                return 0.0
            }
            
            if operatorSymbol == Operator.divide && (operand == errorNumber || partialResult == errorNumber) {
                throw CalculatorError.dividedByZero
            }
            
            return operatorSymbol.calculate(lhs: partialResult, rhs: operand)
        }
        
        operands.reset()
        
        return result
    }
}

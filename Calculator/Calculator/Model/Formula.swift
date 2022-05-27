struct Formula {
    typealias queue = CalculatorItemQueue
    
    private(set) var operands: queue<Double>
    private(set) var operators: queue<Operator.RawValue>
    
    init(operands: queue<Double> = queue<Double>(), operators: queue<Operator.RawValue> = queue<Operator.RawValue>()){
        self.operands = operands
        self.operators = operators
    }
    
    func result() throws -> Double {
        guard let start = operands.displayItems().first else {
            return 0.0
        }
        
        let operandItems = operands.displayItems().filter {
            $0 != start
        }

        let errorNumber = CalculatorError.dividedByZero.errorCaseNumber
        let result = try operandItems.reduce(start) { reuslt, partialResult in
            let operatorSymbol = operators.dequeue() ?? " "
            let `operator` = Operator.allCases.filter {
                $0.symbol == operatorSymbol
            }
            let calculatedValue = `operator`[0].calculate(lhs: reuslt, rhs: partialResult)
            
            if operatorSymbol == "/" && (partialResult == errorNumber || reuslt == errorNumber) {
                throw CalculatorError.dividedByZero
            }
            return calculatedValue
        }
        
        operands.reset()
        return result
    }
}

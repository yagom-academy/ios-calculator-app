struct Formula {
    private(set) var operands: CalculatorItemQueue<Double>
    private(set) var operators: CalculatorItemQueue<String>
    
    init(){
        operands = CalculatorItemQueue<Double>()
        operators = CalculatorItemQueue<String>()
    }
    
    func result() throws -> Double {
        guard let start = operands.displayItems().first else {
            return 0.0
        }
        
        let operandItems = operands.displayItems().filter {
            $0 != operands.displayItems().first
        }

        let errorNumber = CalculatorError.dividedByZero.errorCaseNumber
        let result = try operandItems.reduce(start) { reuslt, partialResult in
            let operatorSymbol = operators.dequeue() ?? ""
            let `operator` = Operator.allCases.filter {
                $0.rawValue == Character(operatorSymbol)
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

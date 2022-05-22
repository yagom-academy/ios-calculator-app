struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<String>()
    
    @discardableResult
    func result() throws -> Double {
        let lhs = operands.dequeue() ?? 0
        let rhs = operands.dequeue() ?? 0
        let operatorSymbol = Character(operators.dequeue() ?? "")
        var result = 0.0
        
        let choice = Operator.allCases.filter {
            $0.rawValue == operatorSymbol
        }
        
        do {
            result = try choice[0].calculate(lhs: lhs, rhs: rhs)
        } catch CalculatorError.dividedByZero {
            throw CalculatorError.dividedByZero
        }
        return result
    }
}

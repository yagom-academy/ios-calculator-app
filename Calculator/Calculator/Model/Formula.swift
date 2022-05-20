struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<String>()
    
    func result() -> Double {
        let lhs = operands.dequeue() ?? 0
        let rhs = operands.dequeue() ?? 0
        let operatorSymbol = Character(operators.dequeue() ?? "")
        var result = 0.0
        
        Operator.allCases.forEach {
            if $0.rawValue == operatorSymbol {
                try? result = $0.calculate(lhs: lhs, rhs: rhs)
                }
            }
        return result
    }
}

struct Formula {
    typealias queue = CalculatorItemQueue
    
    private(set) var operands: queue<Double>
    private(set) var operators: queue<Operator.RawValue>
    
    init(operands: queue<Double> = queue<Double>(), operators: queue<Operator.RawValue> = queue<Operator.RawValue>()){
        self.operands = operands
        self.operators = operators
    }
    
    func result() throws -> Double {
        
        return 0.0
    }
}

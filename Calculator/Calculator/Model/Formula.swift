struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue<Double>()
    var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue<Operator>()
    
    func result() -> Double {
        let headData: Double = operands.head!.data
        let tailData: Double = operands.tail!.data
        
        return operators.peek()!.calculate(headData, tailData)
    }
}

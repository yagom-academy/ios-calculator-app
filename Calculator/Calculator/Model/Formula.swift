struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<String>()
    
    func result() -> Double {
        // TODO: 1. operands, operators 하나씩 가져오기
        let lhs:Double = operands.dequeue() ?? 0
        let rhs:Double = operands.dequeue() ?? 0
        let operatorSymbol:String = operators.dequeue() ?? ""
        
        // TODO: 2. 가져온 값 계산하기
        switch operatorSymbol {
        case "+" :
            return lhs + rhs
        case "-" :
            return lhs - rhs
        case "*" :
            return lhs * rhs
        case "/" :
            return lhs / rhs
        default:
            return 0
        }
        
        // TODO: 3. 가져온 값을 리턴해주기
        
    }
}

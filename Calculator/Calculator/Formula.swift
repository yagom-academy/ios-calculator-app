// Formula: 공식
struct Formula {
    var operands: CalculatorItemQueue<Double>    // 피연산자
    var operators: CalculatorItemQueue<Character>   // 연산자
    
    
    mutating func result() -> Double {
        guard let add = operands.dequeue() else { return 0 }
        
        
        return add
    }
    
}

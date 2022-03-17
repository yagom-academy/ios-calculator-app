import Foundation

struct Formula {
    public var operands: CalculatorItemQueue<Double>
    public var operators: CalculatorItemQueue<Character>
    
    public mutating func result() -> Double {
        var result: Double = 0.0
        
        guard let initNumber = operands.dequeue() else { return 0.0 }
        result = initNumber
        
        
        while !operators.isEmpty {
            guard let numFromQueue: Double = operands.dequeue() else { return 0.0 }
            guard let opFromQueue: Character = operators.dequeue() else { return 0.0 }
            guard let op: Operator = Operator.init(rawValue: opFromQueue) else { return 0.0 }
            result = op.calculate(lhs: result, rhs: numFromQueue)
        }
        
        return result
    }
}

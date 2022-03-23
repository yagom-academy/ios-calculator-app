import Foundation

struct Formula {
    public var operands: CalculatorItemQueue<Double> = CalculatorItemQueue<Double>()
    public var operators: CalculatorItemQueue<Character> = CalculatorItemQueue<Character>()
    
    public mutating func result() throws -> Double {
        var result: Double = 0.0
        
        guard let firstNumber = operands.dequeue() else { return 0.0 }
        result = firstNumber
        
        while !operators.isEmpty {
            guard let operandItem: Double = operands.dequeue() else { return 0.0 }
            guard let operatorSymbol: Character = operators.dequeue() else { return 0.0 }
            guard let operatorItem: Operator = Operator.init(rawValue: operatorSymbol) else { return 0.0 }
            
            do {
                try result = operatorItem.calculate(lhs: result, rhs: operandItem)
            } catch _ as CalculatorError {
                break
            }
        }
        
        return result
    }
}

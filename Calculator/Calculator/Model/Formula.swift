import Foundation

struct Formula {
    var operands: CalculatorItemQueue
    var operators: CalculatorItemQueue
    
    init() {
        self.operands = CalculatorItemQueue()
        self.operators = CalculatorItemQueue()
    }
    
    init?(operands: [String], operators: [String]) {
        self.operands = CalculatorItemQueue()
        self.operators = CalculatorItemQueue()
        
        for operand in operands {
            guard let operand = Double(operand) else {
                return nil
            }
            
            self.operands.enqueue(operand)
        }
        
        for `operator` in operators {
            guard let `operator` = `operator`.first else {
                return nil
            }
            
            guard let `operator` = Operator(rawValue: `operator`) else {
                return nil
            }
            
            self.operators.enqueue(`operator`)
        }
    }
    
    mutating func result() -> Double {
        var result = operands.dequeue() as? Double ?? 0
        
        while let `operator` = operators.dequeue() as? Operator,
              let operand = operands.dequeue() as? Double {
            result = `operator`.calculate(lhs: result, rhs: operand)
        }
        
        return result
    }
}

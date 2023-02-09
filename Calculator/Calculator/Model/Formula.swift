//  Calculator - Formula.swift
//  created by vetto on 2023/01/27

struct Formula {
    private(set) var operands: CalculatorItemQueue<Double>
    private(set) var operators: CalculatorItemQueue<Operator>
    
    init(operands: CalculatorItemQueue<Double>, operators: CalculatorItemQueue<Operator>) {
        self.operands = operands
        self.operators = operators
    }
    
    mutating func result() throws -> Double {
        guard var result = operands.dequeue() else { return Double.zero }
        
        while !operands.isEmpty && !operators.isEmpty {
            guard let operand = operands.dequeue(),
                  let `operator` = operators.dequeue() else { return result }
            
            do {
                result = try `operator`.calculate(lhs: result, rhs: operand)
            } catch CalculatorError.divideByZero {
                return .nan
            } catch {
                throw CalculatorError.calculate
            }
        }
        
        return result
    }
}

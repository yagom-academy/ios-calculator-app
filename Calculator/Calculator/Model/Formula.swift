//
//  Formula.swift
//  Calculator
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<String>
    
    func result() -> Double {
        var result: Double = operands.list.head?.value ?? 0
        var currentOperand = operands.list.head
        var currentOperator = operators.list.head
        var count: Int = 0
        
        while count != operators.count {
            guard let nextOperand = currentOperand?.next,
                  let calculatedOperator = currentOperator else {
                return result
            }
            
            count += 1
            
            switch Character(calculatedOperator.value) {
            case Operator.add.rawValue:
                result = Operator.add.calculate(lhs: result, rhs: nextOperand.value)
            case Operator.subtract.rawValue:
                result = Operator.subtract.calculate(lhs: result, rhs: nextOperand.value)
            case Operator.divide.rawValue:
                result = Operator.divide.calculate(lhs: result, rhs: nextOperand.value)
            case Operator.multiply.rawValue:
                result = Operator.multiply.calculate(lhs: result, rhs: nextOperand.value)
            default:
                print("잘못된 연산자")
            }
            
            currentOperand = currentOperand?.next
            currentOperator = currentOperator?.next
        }
        
        return result
    }
}

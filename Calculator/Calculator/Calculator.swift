import Foundation

protocol Calculator {
    associatedtype CalculatorType
    
    func addition() -> CalculatorType
    func subtraction() -> CalculatorType
    func result() -> CalculatorType
    func clear()
    func stackPush()
    func verifyPriorityOperator()
    func operate(_ present: Operator)
}

protocol DecimalCalculator: Calculator {
    associatedtype CalculatorType
    
    func multiplication() -> CalculatorType
    func division() -> CalculatorType
}

protocol BinaryCalculator: Calculator {
    associatedtype CalculatorType
    
    func and() -> CalculatorType
    func nand() -> CalculatorType
    func or() -> CalculatorType
    func xor() -> CalculatorType
    func nor() -> CalculatorType
    func not() -> CalculatorType
    func leftShift() -> CalculatorType
    func rightShift() -> CalculatorType
}


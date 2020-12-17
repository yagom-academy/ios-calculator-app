import Foundation

protocol Calculator {
    associatedtype CalculatorType
    
    func getOperatorButton() -> CalculatorType
    func result() -> CalculatorType
    func clear()
    func stackPush()
    func verifyPriorityOperator()
    func operate(_ present: Operator)
}


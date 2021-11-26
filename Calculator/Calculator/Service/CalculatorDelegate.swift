import Foundation

protocol CalculatorDelegate: AnyObject {
    func calculator(didChangeCurrentOperandTo operand: String)
    func calculator(didChangeCurrentOperatorTo operator: String)
    func calculator(didReceiveValidExpression expression: (operator: String, operand: String))
    func calculatorDidClearAllData()
}

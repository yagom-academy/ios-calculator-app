import Foundation

protocol CalculatorDelegate: AnyObject {
    func calculator(didChangeCurrentOperandTo operand: String)
    func calculator(didChangeCurrentOperatorTo operator: String)
    func calculatorDidClearAllData()
}

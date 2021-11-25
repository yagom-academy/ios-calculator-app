import Foundation

protocol CalculatorDelegate: AnyObject {
    func calculator(didChangeCurrentOperandTo operand: String)
}

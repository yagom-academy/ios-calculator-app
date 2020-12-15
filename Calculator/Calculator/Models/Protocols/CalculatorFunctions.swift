import Foundation

protocol CommonCalculatorFunctions {
    func add() -> String
    func substract() -> String
    func clear()
    func calculate() -> String
    func getNumber(_ input: String)
}

protocol DecimalCalculatorFunctions: CommonCalculatorFunctions {
    var lhs: Double { get set }
    var rhs: Double { get set }
    func getOperator(_ input: DecimalOperatorType)
    func multiply() -> String
    func divide() -> String
}

protocol BinaryCalculatorFunctions: CommonCalculatorFunctions {
    var lhs: Int { get set }
    var rhs: Int { get set }
    func getOperator(_ input: BinaryOperatorType)
    func and() -> String
    func nand() -> String
    func or() -> String
    func nor() -> String
    func xor() -> String
    func not() -> String
    func leftShift() -> String
    func rightShift() -> String
}

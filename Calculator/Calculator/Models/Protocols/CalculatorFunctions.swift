import Foundation

protocol CommonCalculatorFunctions {
    func add(lhs: String, rhs: String) throws -> String
    func substract(lhs: String, rhs: String) throws -> String
    func clear()
    func calculate() throws -> String
}

protocol DecimalCalculatorFunctions: CommonCalculatorFunctions {
    func multiply(lhs: String, rhs: String) throws -> String
    func divide(lhs: String, rhs: String) throws -> String
}

protocol BinaryCalculatorFunctions: CommonCalculatorFunctions {
    func and(lhs: String, rhs: String) throws -> String
    func nand(lhs: String, rhs: String) throws -> String
    func or(lhs: String, rhs: String) throws -> String
    func nor(lhs: String, rhs: String) throws -> String
    func xor(lhs: String, rhs: String) throws -> String
    func not(lhs: String) throws -> String
    func leftShift(lhs: String, rhs: String) throws -> String
    func rightShift(lhs: String, rhs: String) throws -> String
}

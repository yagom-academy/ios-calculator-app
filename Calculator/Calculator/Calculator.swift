import Foundation

protocol Calculator {
    func addition<T>() -> T
    func subtraction<T>() -> T
    func result<T>() -> T
    func clear()
    func verifyPriorityOperator()
    func operate(_ present: Operator)
}

protocol DecimalCalculator: Calculator {
    func multiplication<T>() -> T
    func division<T>() -> T
}

protocol BinaryCalculator: Calculator {
    func and<T>() -> T
    func nand<T>() -> T
    func or<T>() -> T
    func xor<T>() -> T
    func nor<T>() -> T
    func not<T>() -> T
    func leftShift<T>() -> T
    func rightShift<T>() -> T
}


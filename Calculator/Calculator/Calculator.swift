import Foundation

protocol Calculator {
    func addition<T>() -> T
    func subtraction<T>() -> T
    func result()<T>() -> T
    func clear()
}

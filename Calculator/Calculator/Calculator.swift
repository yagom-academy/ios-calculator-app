import Foundation

class Calculator {
    weak private var delegate: CalculatorDelegate?
    
    convenience init(delegate: CalculatorDelegate) {
        self.init()
        self.delegate = delegate
    }
}

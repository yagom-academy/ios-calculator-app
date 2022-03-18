import Foundation

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operations = CalculatorItemQueue<Operator>()
    
    func result() -> Double {
        return 0
    }
}

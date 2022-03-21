import Foundation

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators =  CalculatorItemQueue<String>()
    
    func result() -> Double {
        return 0
    }
}

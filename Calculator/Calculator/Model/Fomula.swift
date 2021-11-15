
import Foundation

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var oprators = CalculatorItemQueue<Character>()
    
    func result() -> Double {
        
        return 0.0
    }
}

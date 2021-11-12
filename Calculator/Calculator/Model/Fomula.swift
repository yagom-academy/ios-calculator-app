
import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Operation>
    var oprators: CalculatorItemQueue<Double>
    
    func result() -> Double {
        
        return 0.0
    }
}

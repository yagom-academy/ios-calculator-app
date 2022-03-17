import Foundation

struct Formula {
    public var operands: CalculatorItemQueue
    public var operators: CalculatorItemQueue
    
    public func result() -> Double {
        return 0.0
    }
}

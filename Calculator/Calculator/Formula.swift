import Foundation

struct Formula {
    public var operands: CalculatorItemQueue<Int>
    public var operators: CalculatorItemQueue<Int>
    
    public func result() -> Double {
        return 0.0
    }
}

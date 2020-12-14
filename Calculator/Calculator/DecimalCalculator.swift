import Foundation

class DecimalCalculator: Calculator {
    var decimalNumber = Stack<Double>()
    var operatationNumber = Stack <Operator>()
    var index: Double = 0
    
    func addition() {
        decimalNumber.push(element: index)
        
        while !operatationNumber.index.isEmpty {
            let presentOperator = operatationNumber.pop()
            operate(present: presentOperator)
        }
        operatationNumber.push(element: .addition)
        index = decimalNumber.peek()
    }
    
    func subtraction() {
        decimalNumber.push(element: index)
        
        while !operatationNumber.index.isEmpty {
            let presentOperator = operatationNumber.pop()
            operate(present: presentOperator)
        }
        operatationNumber.push(element: .subtraction)
        index = decimalNumber.peek()
    }
    
    func multiplication() {
        decimalNumber.push(element: index)
        
        while !operatationNumber.index.isEmpty {
            let presentOperator = operatationNumber.pop()
            operate(present: presentOperator)
        }
        operatationNumber.push(element: .multiplication)
        index = decimalNumber.peek()
    }
    
    func division() {
        decimalNumber.push(element: index)
        
        while !operatationNumber.index.isEmpty {
            let presentOperator = operatationNumber.pop()
            operate(present: presentOperator)
        }
        operatationNumber.push(element: .division)
        index = decimalNumber.peek()
    }
    
    func result() {
        decimalNumber.push(element: index)
        
        while !operatationNumber.index.isEmpty {
            let presentOperator = operatationNumber.pop()
            operate(present: presentOperator)
        }
        index = decimalNumber.peek()
    }
    
    func clear() {
        decimalNumber.index = []
        operatationNumber.index = []
        index = 0
    }
    
    func operate(present: Operator) {
        var frontNumber: Double = decimalNumber.pop()
        var backNumber: Double = decimalNumber.pop()
        var resultNumber: Double?
        
        switch present {
            case .addition:
                resultNumber = frontNumber + backNumber
            case .subtraction:
                resultNumber = frontNumber - backNumber
            case .multiplication:
                resultNumber = frontNumber * backNumber
            case .division:
                resultNumber = frontNumber / backNumber
            default:
                print("error")
        }
        decimalNumber.push(element: resultNumber!)
    }
    
    
}

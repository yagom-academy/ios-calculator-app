import Foundation

class DecimalCalculator: Calculator {
    var decimalNumber = Stack<Double>()
    var operatationNumber = Stack <Operator>()
    var inputNumber: Double?
    var resultNumber: Double?
    
    func addition() -> Double {
        decimalNumber.push(element: inputNumber!)
        
        while operatationNumber.count != 0 {
            let presentOperator = operatationNumber.pop()
            operate(present: presentOperator)
        }
        operatationNumber.push(element: .addition)
        return resultNumber!
    }
    
    func subtraction() -> Double {
        decimalNumber.push(element: inputNumber!)
        
        while operatationNumber.count != 0 {
            let presentOperator = operatationNumber.pop()
            operate(present: presentOperator)
        }
        operatationNumber.push(element: .subtraction)
        return resultNumber!
    }
    
    func multiplication() -> Double {
        decimalNumber.push(element: inputNumber!)
        
        while operatationNumber.count != 0 {
            let presentOperator = operatationNumber.pop()
            operate(present: presentOperator)
        }
        operatationNumber.push(element: .multiplication)
        return resultNumber!
    }
    
    func division() -> Double {
        decimalNumber.push(element: inputNumber!)
        
        while operatationNumber.count != 0 {
            let presentOperator = operatationNumber.pop()
            operate(present: presentOperator)
        }
        operatationNumber.push(element: .division)
        return resultNumber!
    }
    
    func result() -> Double {
        decimalNumber.push(element: inputNumber!)
        
        while operatationNumber.count != 0 {
            let presentOperator = operatationNumber.pop()
            operate(present: presentOperator)
        }
        return resultNumber!
    }
    
    func clear() {
        decimalNumber.index = []
        operatationNumber.index = []
        inputNumber = 0
    }
    
    func operate(present: Operator) {
        var backNumber: Double = decimalNumber.pop()
        var frontNumber: Double = decimalNumber.pop()
        
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
                print("연산자가 잘못되었습니다.")
        }
        decimalNumber.push(element: resultNumber!)
    }
}

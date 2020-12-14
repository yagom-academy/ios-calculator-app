import Foundation

class DecimalCalculate: DecimalCalculator {
    var decimalNumber = Stack<Double>()
    var operatorSet = Stack<Operator>()
    var inputNumber: Double?
    var resultNumber: Double?
    
    func addition<Double>() -> Double {
        decimalNumber.push(element: inputNumber!)
        checkOperator()
        
        return resultNumber as! Double
    }
    
    func subtraction<Double>() -> Double {
        decimalNumber.push(element: inputNumber!)
        checkOperator()
        
        return resultNumber as! Double
    }
    
    func multiplication<Double>() -> Double {
        decimalNumber.push(element: inputNumber!)
        checkOperator()
        
        return resultNumber as! Double
    }
    
    func division<Double>() -> Double {
        decimalNumber.push(element: inputNumber!)
        checkOperator()
        
        return resultNumber as! Double
    }
    
    func result<Double>() -> Double {
        decimalNumber.push(element: inputNumber!)
        checkOperator()
        
        return resultNumber as! Double
    }
    
    func clear() {
        decimalNumber.index = []
        operatorSet.index = []
        inputNumber = 0
    }
    
    func checkOperator() {
        repeat {
            var presentOperator = operatorSet.pop()
            operate(presentOperator)
        }while operatorSet.count != 0
        operatorSet.push(element: .addition)
    }
    
    func operate(_ present: Operator) {
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

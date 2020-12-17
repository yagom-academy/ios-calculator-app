import Foundation

class DecimalCalculate: Calculator {
    typealias CalculatorType = Double
    
    private var decimalNumber = Stack<Double>()
    private var operatorSet = Stack<Operator>()
    private var inputNumber: Double?
    private var resultNumber: Double?
    private var inputOperator: Operator?
    private var presentOperator: Operator?
    
    func getOperatorButton() -> Double {
        stackPush()
        verifyPriorityOperator()
        
        return resultNumber!
    }
    
    func result() -> Double {
        operatorSet.push(element: inputOperator!)
        verifyPriorityOperator()
        
        return resultNumber!
    }
    
    func clear() {
        decimalNumber.index = []
        operatorSet.index = []
        inputNumber = 0
    }
    
    func stackPush() {
        operatorSet.push(element: inputOperator!)
        decimalNumber.push(element: inputNumber!)
    }
    
    func verifyPriorityOperator() {
        if operatorSet.peek() == .multiplication || operatorSet.peek() == .division || operatorSet.peek() == .sum {
            while operatorSet.count() != 0 {
                presentOperator = operatorSet.pop()
                operate(presentOperator!)
            }
        }
        else {
            operatorSet.push(element: presentOperator!)
        }
    }
    
    func operate(_ present: Operator) {
        guard let backNumber: Double = decimalNumber.pop() else {
            print("십진수 오류")
            return
        }
        guard let frontNumber: Double = decimalNumber.pop() else {
            print("십진수 오류")
            return
        }
        
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
                print("연산이 잘못되었습니다.")
        }
        decimalNumber.push(element: resultNumber!)
    }
}

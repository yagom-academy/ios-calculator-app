import Foundation

class BinaryCalculate: Calculator {
    typealias CalculatorType = Int
    
    private var binaryNumber = Stack<Int>()
    private var operatorSet = Stack<Operator>()
    private var inputNumber: Int?
    private var resultNumber: Int?
    private var inputOperator: Operator?
    private var presentOperator: Operator?
    
    func getOperatorButton() -> Int {
        stackPush()
        verifyPriorityOperator()
        
        return resultNumber!
    }
    
    func result() -> Int {
        operatorSet.push(element: inputOperator!)
        verifyPriorityOperator()

        return resultNumber!
    }
    
    func clear() {
        binaryNumber.index = []
        operatorSet.index = []
        inputNumber = 0
    }
    
    func stackPush() {
        operatorSet.push(element: inputOperator!)
        binaryNumber.push(element: inputNumber!)
    }
    
    func verifyPriorityOperator() {
        if operatorSet.peek() == .and || operatorSet.peek() == .nand || operatorSet.peek() == .sum {
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
        let backNumber = String(binaryNumber.pop())
        guard let binaryBackNumber = Int(backNumber, radix: 2) else {
            print("이진수 오류")
            return
        }
        let frontNumber = String(binaryNumber.pop())
        guard let binaryFrontNumber = Int(frontNumber, radix: 2) else {
            print("이진수 오류")
            return
        }

        switch present {
            case .addition:
                resultNumber = binaryFrontNumber + binaryBackNumber
            case .subtraction:
                resultNumber = binaryFrontNumber - binaryBackNumber
            case .and:
                resultNumber = binaryFrontNumber & binaryBackNumber
            case .nand:
                resultNumber = ~(binaryFrontNumber & binaryBackNumber)
            case .or:
                resultNumber = binaryFrontNumber | binaryBackNumber
            case .xor:
                resultNumber = binaryFrontNumber ^ binaryBackNumber
            case .nor:
                resultNumber = ~(binaryFrontNumber | binaryBackNumber)
            case .not:
                resultNumber = ~(binaryBackNumber)
            case .leftShift:
                resultNumber = binaryBackNumber << 1
            case .rightShift:
                resultNumber = binaryBackNumber << 1
            default:
                print("연산자가 잘못되었습니다.")
        }
        binaryNumber.push(element: resultNumber!)
    }
}

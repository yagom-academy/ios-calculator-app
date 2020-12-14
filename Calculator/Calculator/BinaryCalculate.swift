import Foundation

class BinaryCalculate: BinaryCalculator {
    var binaryNumber = Stack<Int>()
    var operatorSet = Stack<Operator>()
    var inputNumber: Int?
    var resultNumber: Int?
        
    func addition<Int>() -> Int {
        binaryNumber.push(element: inputNumber!)
        checkOperator()
        
        return resultNumber as! Int
    }
    
    func subtraction<Int>() -> Int {
        binaryNumber.push(element: inputNumber!)
        checkOperator()

        return resultNumber as! Int
    }
    
    func and<Int>() -> Int {
        binaryNumber.push(element: inputNumber!)
        checkOperator()

        return resultNumber as! Int
    }
    
    func nand<Int>() -> Int {
        binaryNumber.push(element: inputNumber!)
        checkOperator()

        return resultNumber as! Int
    }

    func or<Int>() -> Int {
        binaryNumber.push(element: inputNumber!)
        checkOperator()

        return resultNumber as! Int
    }

    func xor<Int>() -> Int {
        binaryNumber.push(element: inputNumber!)
        checkOperator()

        return resultNumber as! Int
    }

    func nor<Int>() -> Int {
        binaryNumber.push(element: inputNumber!)
        checkOperator()

        return resultNumber as! Int
    }

    func not<Int>() -> Int {
        binaryNumber.push(element: inputNumber!)
        checkOperator()

        return resultNumber as! Int
    }

    func leftShift<Int>() -> Int {
        binaryNumber.push(element: inputNumber!)
        checkOperator()

        return resultNumber as! Int
    }

    func rightShift<Int>() -> Int {
        binaryNumber.push(element: inputNumber!)
        checkOperator()

        return resultNumber as! Int
    }

    func result<Int>() -> Int {
        binaryNumber.push(element: inputNumber!)
        checkOperator()

        return resultNumber as! Int
    }

    func clear() {
        binaryNumber.index = []
        operatorSet.index = []
        inputNumber = 0
    }

    func checkOperator() {
        repeat {
            let presentOperator = operatorSet.pop()
            operate(presentOperator)
            operatorSet.push(element: presentOperator)
        } while operatorSet.count != 0
    }

    func operate(_ present: Operator) {
        let backNumber = String(binaryNumber.pop())
        let binaryBackNumber = Int(backNumber, radix: 2)
        let frontNumber = String(binaryNumber.pop())
        let binaryFrontNumber = Int(frontNumber, radix: 2)

        switch present {
            case .addition:
                resultNumber = binaryFrontNumber! + binaryBackNumber!
            case .subtraction:
                resultNumber = binaryFrontNumber! - binaryBackNumber!
            case .and:
                resultNumber = binaryFrontNumber! & binaryBackNumber!
            case .nand:
                resultNumber = ~(binaryFrontNumber! & binaryBackNumber!)
            case .or:
                resultNumber = binaryFrontNumber! | binaryBackNumber!
            case .xor:
                resultNumber = binaryFrontNumber! ^ binaryBackNumber!
            case .nor:
                resultNumber = ~(binaryFrontNumber! | binaryBackNumber!)
            case .not:
                resultNumber = ~(binaryBackNumber!)
            case .leftShift:
                resultNumber = binaryBackNumber! << 1
            case .rightShift:
                resultNumber = binaryBackNumber! << 1
            default:
                print("연산자가 잘못되었습니다.")
        }
        binaryNumber.push(element: resultNumber!)
    }
}

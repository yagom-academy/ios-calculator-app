
struct BinaryCalculator {
    
    var numStack = Stack<String>()
    var operatorStack = Stack<BinaryOperator>()
    
    var current: String = "0"
    
    /// 연산자가 입력되었을 때 공통으로 동작할 함수
    mutating  func calculate(_ operator: BinaryOperator) {
        numStack.push(current)
        
        switch `operator` {
        case .and, .nand: checkPrevOperator()
        default: useAllOperator()
        }
        
        operatorStack.push(`operator`)

        guard let peekValue = numStack.peek() else {
            print(Error.numStackisEmpty.rawValue + "계산기가 초기화됩니다.")
            reset()
            return
        }
        current = peekValue
    }
    
    /// 스택에서 이전 연산자를 꺼내어 연산
    mutating func operatePrev(_ prevOperator: BinaryOperator) {

        guard let firstPop = numStack.pop(), let secondPop = numStack.pop() else {
            print(Error.numStackisEmpty.rawValue + "계산기가 초기화됩니다.")
            reset()
            return
        }
        
        guard let new: Int = Int(firstPop, radix: 2), let old: Int = Int(secondPop, radix: 2) else {
            current = "오류"
            return
        }
        
        let newValue: Int
        
        switch prevOperator {
        case .plus: newValue = old + new
        case .minus: newValue = old - new
        case .and: newValue = old & new
        case .nand: newValue = ~(old & new)
        case .or: newValue = old | new
        case .nor: newValue = ~(old | new)
        case .xor: newValue = old ^ new
        }
        
        numStack.push(String(newValue, radix: 2))
    }
    
    /// 스택에서 모든 연산자를 꺼내어 연산
    mutating func useAllOperator() {
        if let someOperator = operatorStack.pop() {
            for _ in 1...operatorStack.count() {
                operatePrev(someOperator)
            }
        } else {
            return
        }
    }
    
    /// 스택에서 이전 연산자를 확인 후, 연산을 결정
    mutating func checkPrevOperator() {
        if operatorStack.elements.last == .and || operatorStack.elements.last == .nand {
            guard let someOperator = operatorStack.pop() else {
                print(Error.etc.rawValue + "계산기가 초기화됩니다.")
                reset()
                return
            }
            operatePrev(someOperator)
        }
    }
}

// MARK: - 단항 연산
extension BinaryCalculator {

    mutating func not() {
        guard let convertedCurrent = Int(current, radix: 2) else {
            print("오류")
            return
        }
        
        let invertedCurrent = ~(convertedCurrent)
        numStack.push(String(invertedCurrent, radix: 2))
        
        guard let peekValue = numStack.peek() else {
            print(Error.numStackisEmpty.rawValue + "계산기가 초기화됩니다.")
            reset()
            return
        }
        current = peekValue
    }
    
    mutating func shiftToLeft() {
        var currentValue = current
        if current.count == 9 {
            currentValue.removeFirst()
        }
        current = currentValue + "0"
        
        if current == "000000000" {
            current = "0"
        }
    }
    
    mutating func shiftToRight() {
        guard current != "0" else {
            return
        }
        
        var currentValue = current
        currentValue.removeLast()
        current = currentValue
    }
}

// MARK: - 기타 메서드
extension BinaryCalculator {

    mutating func reset() {
        numStack.elements = []
        operatorStack.elements = []
        current = "0"
    }
    
    mutating func printResult() {
        numStack.push(current)
        useAllOperator()

        guard let peekValue = numStack.peek() else {
            print(Error.numStackisEmpty.rawValue + "계산기가 초기화됩니다.")
            reset()
            return
        }
        current = peekValue
    }
}




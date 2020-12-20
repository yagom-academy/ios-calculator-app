
struct BinaryCalculator {
    var numStack = Stack<String>()
    var operatorStack = Stack<BinaryOperator>()
    
    var current: String = "0"
    
    /// 연산자가 입력되었을 때 공통으로 동작할 함수
    mutating  func calculate(_ operator: BinaryOperator) throws {
        numStack.push(checkDigits(current))
        
        switch `operator` {
        case .and, .nand: try checkPrevOperator()
        default: try useAllOperator()
        }
        
        operatorStack.push(`operator`)

        guard let peekValue = numStack.peek() else {
            throw CalculatorError.numStackisEmpty
        }
        current = peekValue
    }
    
    /// 스택에서 이전 연산자를 꺼내어 연산
    mutating func calculatePrevOperator(_ prevOperator: BinaryOperator) throws {
        guard let firstPop = numStack.pop(), let secondPop = numStack.pop() else {
            throw CalculatorError.numStackisEmpty
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
        
        numStack.push(checkDigits(String(newValue, radix: 2)))
    }
    
    /// 스택에서 모든 연산자를 꺼내어 연산
    mutating func useAllOperator() throws {
        if let someOperator = operatorStack.pop() {
            for _ in 0...operatorStack.count() {
                try calculatePrevOperator(someOperator)
            }
        }
    }
    
    /// 스택에서 이전 연산자를 확인 후, 연산을 결정
    mutating func checkPrevOperator() throws {
        if operatorStack.elements.last == .and || operatorStack.elements.last == .nand {
            guard let someOperator = operatorStack.pop() else {
                throw CalculatorError.etc
            }
            try calculatePrevOperator(someOperator)
        }
    }
}

// MARK: - 단항 연산
extension BinaryCalculator {
    mutating func not() throws {
        guard let convertedCurrent = Int(current, radix: 2) else {
            throw CalculatorError.etc
        }
        
        let invertedCurrent = ~(convertedCurrent)
        numStack.push(String(invertedCurrent, radix: 2))
        
        guard let peekValue = numStack.peek() else {
            throw CalculatorError.numStackisEmpty
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
    
    mutating func printResult() throws {
        numStack.push(current)
        try useAllOperator()

        guard let peekValue = numStack.peek() else {
            throw CalculatorError.numStackisEmpty
        }
        current = peekValue
    }
}

// MARK: - 자릿수 9자리로 제한
extension BinaryCalculator {
    func checkDigits(_ num: String) -> String {
        var currentString = num
        
        if currentString.count > 9 {
            let surplus = currentString.count - 9
            currentString.removeLast(surplus)
            return currentString
        } else {
            return currentString
        }
    }
}



struct DecimalCalculator {
    var numStack = Stack<String>()
    var operatorStack = Stack<DecimalOperator>()
    
    // 이전 연산자를 저장하는 스택
    var prevNumberStack = [String]()
    var prevOperatorStack = [DecimalOperator]()
    
    var current: String = "0"
    
    /// 연산자가 입력되었을 때 공통으로 동작할 함수
    mutating func calculate(_ operator: DecimalOperator) throws {
        saveCurrentStack()
        numStack.push(checkDigits(current))
        
        switch `operator` {
        case .plus, .minus: try useAllOperator()
        case .multiple, .divide: try checkPrevOperator()
        }
        
        operatorStack.push(`operator`)
        
        guard let peekValue = numStack.peek() else {
            throw CalculatorError.numStackisEmpty
        }
        current = peekValue
    }
    
    /// 스택에서 이전 연산자를 꺼내어 연산
    mutating func calculatePrevOperator(_ prevOperator: DecimalOperator) throws {
        guard let firstPop = numStack.pop(), let secondPop = numStack.pop() else {
            throw CalculatorError.numStackisEmpty
        }
        
        guard let new: Double = Double(firstPop), let old: Double = Double(secondPop) else {
            current = "오류"
            return
        }
        
        let newValue: Double
        
        switch prevOperator {
        case .plus:
            newValue = old + new
        case .minus:
            newValue = old - new
        case .multiple:
            newValue = old * new
        case .divide:
            if new == 0 {
                current = "오류"
                return
            }
            newValue = old / new
        }
        
        numStack.push(checkDigits(String(newValue)))
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
        if operatorStack.elements.last == .multiple || operatorStack.elements.last == .divide {
            guard let someOperator = operatorStack.pop() else {
                throw CalculatorError.etc
            }
            try calculatePrevOperator(someOperator)
        }
    }
    
    // stack을 임시 보관, 꺼내오는 메서드.
    // 계산기에서 연산자를 +/-와 */를 섞어서 연속으로 입력할 경우 이전 버전의 스택으로 다시 돌아와야한다.
    mutating func saveCurrentStack() {
        prevNumberStack = numStack.elements
        prevOperatorStack = operatorStack.elements
    }
    
    mutating func loadCurrentStack() throws {
        numStack.elements = prevNumberStack
        operatorStack.elements = prevOperatorStack
        
        guard let peekValue = numStack.peek() else {
            throw CalculatorError.numStackisEmpty
        }
        current = peekValue
    }
}

// MARK: - 기타 메서드
extension DecimalCalculator {
    mutating func reset() {
        numStack.elements = []
        operatorStack.elements = []
        current = "0"
    }
    
    // 처리를 해줄건지.
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
extension DecimalCalculator {
    func cutExtraDigits(_ num: inout String) {
        if num.contains("-") && num.contains(".") {
            let sulplus = num.count - 11
            num.removeLast(sulplus)
        } else if num.contains("-") || num.contains(".") {
            let sulplus = num.count - 10
            num.removeLast(sulplus)
        } else if !num.contains("-") && num.contains(".") {
            let sulplus = num.count - 9
            num.removeLast(sulplus)
        }
    }
    
    func checkLast(_ num: inout String) {
        if num.hasSuffix(".0") {
            num.removeLast(2)
        } else if num.contains(".") && num.last == "0" {
            num.removeLast()
        }
    }
    
    func checkDigits(_ num: String) -> String {
        var currentString = num
        
        if currentString.count > 9 {
            cutExtraDigits(&currentString)
            checkLast(&currentString)
            return currentString
        } else {
            checkLast(&currentString)
            return currentString
        }
    }
}

// test를 위한 메서드
extension DecimalCalculator {
    func getNumStack() -> [String] {
        return numStack.elements
    }
    
    func getOperatorStack() -> [DecimalOperator] {
        return operatorStack.elements
    }
    
    func getCurrent() -> String {
        return current
    }
}

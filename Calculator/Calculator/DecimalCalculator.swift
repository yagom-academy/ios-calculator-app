
struct DecimalCalculator {
    
    var numStack = Stack<String>()
    var operatorStack = Stack<DecimalOperator>()
    
    var current: String = "0"
    
    /// 스택에서 이전 연산자를 꺼내어 연산
    func operatePrev(_ prevOperator: DecimalOperator) {
        let new: Double = Double(numStack.pop() ?? "0") ?? 0
        let old: Double = Double(numStack.pop() ?? "0") ?? 0
        let newValue: Double
        
        switch prevOperator {
        case .plus:
            newValue = old + new
        case .minus:
            newValue = old - new
        case .multiple:
            newValue = old * new
        case .divide:
            guard new != 0 else {
                print("오류")
                return
            }
            newValue = old / new
        }
        
        numStack.push(String(newValue))
    }
    
    /// 스택에서 모든 연산자를 꺼내어 연산
    func useAllOperator() {
        while !operatorStack.elements.isEmpty {
            guard let someOperator = operatorStack.pop() else {
                print("오류")
                return
            }
            operatePrev(someOperator)
        }
    }
    
    /// 스택에서 이전 연산자를 확인 후, 연산을 결정
    func checkPrevOperator() {
        if operatorStack.elements.last == .multiple || operatorStack.elements.last == .divide {
            guard let someOperator = operatorStack.pop() else {
                print("오류")
                return
            }
            operatePrev(someOperator)
        }
    }
    
    /// 연산자가 입력되었을 때 공통으로 동작할 함수
    mutating func calculate(_ operator: DecimalOperator) {
        numStack.push(current)
        
        switch `operator` {
        case .plus, .minus: useAllOperator()
        case .multiple, .divide: checkPrevOperator()
        }
        
        operatorStack.push(`operator`)
        current = numStack.peek() ?? "0"
    }
}

// MARK: - BasicCalculatable
extension DecimalCalculator: BasicCalculatable {
    mutating func plus() {
        calculate(.plus)
    }
    
    mutating func minus() {
        calculate(.minus)
    }
    
    mutating func reset() {
        numStack.elements = []
        operatorStack.elements = []
        current = "0"
    }
    
    mutating func printResult() {
        numStack.push(current)
        useAllOperator()
        
        current = numStack.peek() ?? "0"
    }
}

// MARK: - 10진 계산기에서만 가능한 연산
extension DecimalCalculator {
    mutating func multiple() {
        calculate(.multiple)
    }
    
    mutating func divide() {
        calculate(.divide)
    }
}

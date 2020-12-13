
struct DecimalCalculator: BasicCalculatable {
    
    var numStack = Stack<Double>()
    var operatorStack = Stack<DecimalOperator>()
    
    var current: Double = 0
    
    // 사칙연산
    mutating func plus() {
        calculate(.plus)
    }
    
    mutating func minus() {
        calculate(.minus)
    }
    
    mutating func multiple() {
        calculate(.multiple)
    }
    
    mutating func divide() {
        calculate(.divide)
    }
    
    // 계산기 기능
    mutating func reset() {
        numStack.elements = []
        operatorStack.elements = []
        current = 0
    }
    
    mutating func printResult() {
        numStack.push(current)
        useAllOperator()
        
        current = numStack.peek() ?? 0
    }
}

// operator 관련 기능
extension DecimalCalculator {
    func operatePrev(_ prevOperator: DecimalOperator) {
        let new: Double = numStack.pop() ?? 0
        let old: Double = numStack.pop() ?? 0
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
                print("오류")
                return
            }
            newValue = old / new
        }
        
        numStack.push(newValue)
    }
    
    func useAllOperator() {
        while !operatorStack.elements.isEmpty {
            guard let someOperator = operatorStack.pop() else {
                print("오류")
                return
            }
            operatePrev(someOperator)
        }
    }
    
    func checkPrevOperator() {
        if operatorStack.elements.last == .multiple ||
            operatorStack.elements.last == .divide {
            guard let someOperator = operatorStack.pop() else {
                print("오류")
                return
            }
            operatePrev(someOperator)
        }
    }
    
    mutating func calculate(_ operator: DecimalOperator) {
        numStack.push(current)
        
        switch `operator` {
        case .plus, .minus: useAllOperator()
        case .multiple, .divide: checkPrevOperator()
        }
        
        operatorStack.push(`operator`)
        current = numStack.peek() ?? 0
    }
}

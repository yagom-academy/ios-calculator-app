
struct DecimalCalculator: BasicCalculatable {
    
    var numStack = Stack<Double>()
    var operatorStack = Stack<Operator>()
    
    var current: Double = 0
    
    func plus() {
        <#code#>
    }
    
    func minus() {
        <#code#>
    }
    
    func reset() {
        <#code#>
    }
    
    func printResult() {
        <#code#>
    }
}

// operator 관련 기능
extension DecimalCalculator {
    func operatePrev(_ prevOperator: Operator) {
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
        default:
            print("오류")
            return
        }
        
        numStack.push(newValue)
    }
    
    func useAllOperator() {
        while !operatorStack.elements.isEmpty {
            operatePrev(operatorStack.pop() ?? .etc)
        }
    }
    
    func checkPrevOperator() {
        if operatorStack.elements.last == .multiple ||
            operatorStack.elements.last == .divide {
            operatePrev(operatorStack.pop() ?? .etc)
        }
    }
    
    mutating func calculate(_ operator: Operator) {
        numStack.push(current)
        
        switch `operator` {
        case .plus, .minus: useAllOperator()
        case .multiple, .divide: checkPrevOperator()
        case .etc: print("오류")
        }
        
        operatorStack.push(`operator`)
        current = numStack.peek() ?? 0
    }
}

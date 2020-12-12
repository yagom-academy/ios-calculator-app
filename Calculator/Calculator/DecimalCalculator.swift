
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
        case .multiple:
            newValue = old * new
        case .divide:
            if new == 0 {
                print("오류")
                return
            }
            newValue = old / new
        case .plus:
            newValue = old + new
        case .minus:
            newValue = old - new
        default:
            print("오류")
            return
        }
        
        numStack.push(newValue)
    }
}

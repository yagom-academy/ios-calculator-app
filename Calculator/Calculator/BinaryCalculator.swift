
struct BinaryCalculator: BasicCalculatable {
    
    var numStack = Stack<String>()
    var operatorStack = Stack<BinaryOperator>()
    
    var current: String = "0"
    
    mutating func plus() {
        <#code#>
    }
    
    mutating func minus() {
        <#code#>
    }
    
    mutating func reset() {
        <#code#>
    }
    
    mutating func printResult() {
        <#code#>
    }
    
}

//  operator 관련 메서드
extension BinaryCalculator {
    func operatePrev(_ prevOperator: BinaryOperator) {
        let newValue: Int
        let new = Int(numStack.pop()  ?? "0", radix: 2) ?? 0
        let old = Int(numStack.pop() ?? "0", radix: 2) ?? 0
        
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
        if operatorStack.elements.last == .and ||
            operatorStack.elements.last == .nand {
            guard let someOperator = operatorStack.pop() else {
                print("오류")
                return
            }
            operatePrev(someOperator)
        }
    }
    
    mutating  func calculate(_ operator: BinaryOperator) {
        numStack.push(current)
        
        switch `operator` {
        case .and, .nand: checkPrevOperator()
        default: useAllOperator()
        }
        
        operatorStack.push(`operator`)
        current = numStack.peek() ?? "0"
    }
}

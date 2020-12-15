
struct BinaryCalculator {
    
    var numStack = Stack<String>()
    var operatorStack = Stack<BinaryOperator>()
    
    var current: String = "0"
    
    /// 스택에서 이전 연산자를 꺼내어 연산
    func operatePrev(_ prevOperator: BinaryOperator) {
        let newValue: Int
        let new = Int(numStack.pop() ?? "0", radix: 2) ?? 0
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
        if operatorStack.elements.last == .and || operatorStack.elements.last == .nand {
            guard let someOperator = operatorStack.pop() else {
                print("오류")
                return
            }
            operatePrev(someOperator)
        }
    }
    
    /// 연산자가 입력되었을 때 공통으로 동작할 함수
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

// MARK: - BasicCalculatable
extension BinaryCalculator: BasicCalculatable {

    mutating func plus() {
        calculate(.plus)
    }
    
    mutating func  minus() {
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

// MARK: - 2진 계산기에서만 가능한 연산
extension BinaryCalculator {
    
    mutating func and() {
        calculate(.and)
    }
    
    mutating func nand() {
        calculate(.nand)
    }
    
    mutating func or() {
        calculate(.or)
    }
    
    mutating func nor() {
        calculate(.nor)
    }
    
    mutating func xor() {
        calculate(.xor)
    }
    
    // MARK: 단항 연산
    mutating func not() {
        let invertedCurrent = ~(Int(current, radix: 2) ?? 0)
        numStack.push(String(invertedCurrent, radix: 2))
        
        current = numStack.peek() ?? "0"
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





import Foundation

class DecimalCalculator {
    private var lowOperatorStack = Stack<DecimalOperatorType>()
    private var highOperatorStack = Stack<DecimalOperatorType>()
    private var operandStack = Stack<Double>()
    private var operandBuffer = String.blank
    private var outputValue = Double.zero
    private let operators = DecimalOperatorType.allCases.map { $0.description }
    private var lastOperand = Double.zero
    private var lastOperator = DecimalOperatorType.add.description
    
    func input(_ inputValue: String) {
        if operators.contains(inputValue) == false {
            operandBuffer += inputValue
        } else if inputValue == DecimalOperatorType.equal.description {
            if operandBuffer.count != Int.zero {
                moveToOperandStack(operandBuffer)
            } else if operandBuffer.count == Int.zero {
                moveToOperandStack(String(lastOperand))
            }
            
            if operandStack.count > (highOperatorStack.count + lowOperatorStack.count) {
                _ = moveToOperatorStack(lastOperator)
                guard let topNumberOperandStack = operandStack.peek() else { return }
                lastOperand = topNumberOperandStack
                calculate(currentOperator: inputValue)
            } else if operandStack.count == Int.one {
                _ = moveToOperatorStack(lastOperator)
                calculate(currentOperator: inputValue)
            } else {
                calculate(currentOperator: inputValue)
            }
        } else if inputValue == ResetType.reset {
            reset()
            return
        } else {
            moveToOperandStack(operandBuffer)
            guard let topNumberOperandStack = operandStack.peek() else { return }
            lastOperand = topNumberOperandStack
            lastOperator = inputValue
            if moveToOperatorStack(inputValue) == false {
                calculate(currentOperator: inputValue)
                guard let topNumberOperandStack = operandStack.peek() else { return }
                lastOperand = topNumberOperandStack
            } else {
                return
            }
        }
    }
    
    private func calculate(currentOperator: String) {
        if lowOperatorStack.isEmpty {
            guard let highOperator = highOperatorStack.pop() else { return }
            guard let result = pickCalculation(operatorType: highOperator) else { return }
            operandStack.push(result)
            if currentOperator == DecimalOperatorType.equal.description { return }
            _ = moveToOperatorStack(currentOperator)
        } else if highOperatorStack.isEmpty {
            if currentOperator == DecimalOperatorType.add.description || currentOperator == DecimalOperatorType.subtract.description {
                guard let lowOperator = lowOperatorStack.pop() else { return }
                guard let result = pickCalculation(operatorType: lowOperator) else { return }
                operandStack.push(result)
                _ = moveToOperatorStack(currentOperator)
            } else if currentOperator == DecimalOperatorType.equal.description {
                guard let lowOperator = lowOperatorStack.pop() else { return }
                guard let result = pickCalculation(operatorType: lowOperator) else { return }
                operandStack.push(result)
            }
        } else {
            if currentOperator == DecimalOperatorType.add.description || currentOperator == DecimalOperatorType.subtract.description {
                guard let highOperator = highOperatorStack.pop() else { return }
                guard let result = pickCalculation(operatorType: highOperator) else { return }
                operandStack.push(result)
                guard let lowOperator = lowOperatorStack.pop() else { return }
                guard let secondResult = pickCalculation(operatorType: lowOperator) else { return }
                operandStack.push(secondResult)
                _ = moveToOperatorStack(currentOperator)
            } else if currentOperator == DecimalOperatorType.multiple.description || currentOperator == DecimalOperatorType.divide.description {
                guard let highOperator = highOperatorStack.pop() else { return }
                guard let result = pickCalculation(operatorType: highOperator) else { return }
                operandStack.push(result)
                _ = moveToOperatorStack(currentOperator)
            } else if currentOperator == DecimalOperatorType.equal.description {
                guard let highOperator = highOperatorStack.pop() else { return }
                guard let result = pickCalculation(operatorType: highOperator) else { return }
                operandStack.push(result)
                guard let lowOperator = lowOperatorStack.pop() else { return }
                guard let secondResult = pickCalculation(operatorType: lowOperator) else { return }
                operandStack.push(secondResult)
            }
        }
    }
    
    func output() {
        guard let outputValue = operandStack.peek() else { return }
        print(convertInteger(value: String(outputValue)))
    }
    
    func reset() {
        lowOperatorStack.reset()
        highOperatorStack.reset()
        operandBuffer = String.blank
    }
    
    private func pickCalculation(operatorType: DecimalOperatorType) -> Double? {
        guard let first = operandStack.pop(), let second = operandStack.pop() else { fatalError() }
        switch operatorType {
        case .add:
            return Double(add(first: first, second: second))
        case .subtract:
            return Double(subtract(first: first, second: second))
        case .multiple:
            return Double(multiple(first: first, second: second))
        case .divide:
            return Double(divide(first: first, second: second))
        default:
            fatalError()
        }
    }
    
    // MARK: - Operation
    private func add(first: Double, second: Double) -> String {
        let result = convertInteger(value: String(second + first))
        return result
    }
    
    private func subtract(first: Double, second: Double) -> String {
        let result = convertInteger(value: String(second - first))
        return result
    }
    
    private func multiple(first: Double, second: Double) -> String {
        let result = convertInteger(value: String(second * first))
        return result
    }
    
    private func divide(first: Double, second: Double) -> String {
        let result = convertInteger(value: String(second / first))
        return result
    }
    
    // MARK: - Divide Integer, Primes
    private func convertInteger(value: String) -> String {
        let integerPrimes = value.components(separatedBy: String.dot)
        guard let primeNumber = integerPrimes.last,
              let integerNumber = integerPrimes.first else {
            return value
        }
        if primeNumber.count == Int.one && primeNumber == String.zero {
            return String(integerNumber.prefix(9))
        } else {
            return value.contains(String.dot) ? String(value.prefix(10)) : String(value.prefix(9))
        }
    }
    
    // MARK: - Move Stack
    private func moveToOperandStack(_ value: String) {
        guard let numberValue = Double(value) else {
            return
        }
        operandStack.push(numberValue)
        operandBuffer = String.blank
    }
    
    private func moveToOperatorStack(_ operatorValue: String) -> Bool {
        guard let operatorType = DecimalOperatorType(rawValue: operatorValue) else {
            fatalError()
        }
        switch operatorType {
        case .add, .subtract :
            return pushLowPriority(operatorType)
        case .multiple, .divide :
            return pushHighPriority(operatorType)
        default:
            fatalError()
        }
    }
    
    // MARK: - Priority
    private func pushLowPriority(_ opertaorValue: DecimalOperatorType) -> Bool {
        if lowOperatorStack.isEmpty && highOperatorStack.isEmpty {
            lowOperatorStack.push(opertaorValue)
            return true
        } else if lowOperatorStack.isEmpty == false && highOperatorStack.isEmpty == true {
            return false
        } else if lowOperatorStack.isEmpty == true && highOperatorStack.isEmpty == false {
            return false
        } else {
            return false
        }
    }
    
    private func pushHighPriority(_ opertaorValue: DecimalOperatorType) -> Bool {
        if lowOperatorStack.isEmpty && highOperatorStack.isEmpty {
            highOperatorStack.push(opertaorValue)
            return true
        } else if lowOperatorStack.isEmpty == false && highOperatorStack.isEmpty == true {
            highOperatorStack.push(opertaorValue)
            return true
        } else if lowOperatorStack.isEmpty == true && highOperatorStack.isEmpty == false {
            return false
        } else {
            return false
        }
    }
}

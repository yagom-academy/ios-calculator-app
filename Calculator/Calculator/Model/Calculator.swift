//
//  Calculator.swift
//  Calculator
//
//  Created by 덕복 on 2021/03/27.
//

class Calculator<OperandType: Operand, InfixOperatorType: InfixOperator, PrefixOperatorType: PrefixOpreator> {
    private var postfixedList = Array<CalculatingElement>()
    private var operandStack = Stack<OperandType>()
    private var infixOperatorStack = Stack<InfixOperatorType>()
    private(set) var lastOperand: OperandType?
    private(set) var lastOperator: InfixOperatorType?
    private(set) var calculated: OperandType? {
        didSet {
            guard let toPrint = calculated else { return }
            print("calculated: \(toPrint), postfixedList: \(postfixedList), operandStack: \(operandStack), operatorStack: \(infixOperatorStack)")
        }
    }
    
    fileprivate init() { }
    
    func calculate(by prefixOperator: PrefixOperatorType, x: OperandType) -> OperandType {
        return OperandType.zero
    }
    
    fileprivate func calculate(lhs: OperandType, by infixOperator: InfixOperatorType, rhs: OperandType) -> OperandType {
        return OperandType.zero
    }
    
    func appendPostfixedList(_ operand: OperandType) {
        postfixedList.append(operand)
        lastOperand = operand
    }
    
    func appendPostfixedList(_ infixOperator: InfixOperatorType) {
        while infixOperatorStack.isNotEmpty {
            if infixOperator.isPrecedence(over: infixOperatorStack.peek()!) { break }
            guard let infixOperator = infixOperatorStack.pop() else { return }
            
            postfixedList.append(infixOperator)
            operate()
        }
        
        infixOperatorStack.push(infixOperator)
        lastOperator = infixOperator
    }
    
    func appendPostfixedList(contentsOf elements: String) {
        for element in elements.components(separatedBy: " ") {
            if let infixOperator = InfixOperatorType(rawValue: element) {
                appendPostfixedList(infixOperator)
            }
            if let operand = OperandType(element) {
                appendPostfixedList(operand)
            }
        }
    }
    
    private func operate() {
        while false == postfixedList.isEmpty {
            let element = postfixedList.removeFirst()
            if element is OperandType {
                operandStack.push(element as! OperandType)
            }
            if element is InfixOperatorType {
                let infixOperator = element as! InfixOperatorType
                guard let rightOperand = operandStack.pop() else { return }
                guard let leftOperand = operandStack.pop() else { return }
                calculated = calculate(lhs: leftOperand, by: infixOperator, rhs: rightOperand)
                operandStack.push(calculated!)
            }
        }
    }
    
    func equal() {
        while infixOperatorStack.isNotEmpty {
            guard let infixOperator = infixOperatorStack.pop() else { return }
            postfixedList.append(infixOperator)
        }
        operate()
    }
    
    func clear() {
        postfixedList.removeAll()
        infixOperatorStack.clear()
        operandStack.clear()
    }
}

class DecimalCalculator: Calculator<Decimal, DecimalInfixOperator, DecimalPrefixOperator> {
    static let shared = DecimalCalculator()
    
    override func calculate(by prefixOperator: DecimalPrefixOperator, x: Decimal) -> Decimal {
        let value = x.value
        
        switch prefixOperator {
        case .unaryMinus:
            return Decimal(-value)
        }
    }
    
    override func calculate(lhs: Decimal, by infixOperator: DecimalInfixOperator, rhs: Decimal) -> Decimal {
        let leftValue = lhs.value
        let rightValue = rhs.value
        
        switch infixOperator {
        case .multifly:
            return Decimal(leftValue * rightValue)
        case .divide:
            return Decimal(leftValue / rightValue)
        case .add:
            return Decimal(leftValue + rightValue)
        case .subtract:
            return Decimal(leftValue - rightValue)
        }
    }
}

class BinaryCalculator: Calculator<Binary, BinaryInfixOpeartor, BinaryPrefixOperator> {
    static let shared = BinaryCalculator()
    
    override func calculate(by prefixOperator: BinaryPrefixOperator, x: Binary) -> Binary {
        let value = x.value
        
        switch prefixOperator {
        case .bitwiseNOT:
            return Binary(~value)
        case .unaryMinus:
            return Binary(-value)
        }
    }
    
    override func calculate(lhs: Binary, by infixOperator: BinaryInfixOpeartor, rhs: Binary) -> Binary {
        let leftValue = lhs.value
        let rightValue = rhs.value
        
        switch infixOperator {
        case .bitwiseLeftShift:
            return Binary(leftValue << rightValue)
        case .bitwiseRightShift:
            return Binary(leftValue >> rightValue)
        case .bitwiseAND:
            return Binary(leftValue & rightValue)
        case .bitwiseNAND:
            return Binary(~leftValue | ~rightValue)
        case .add:
            return Binary(leftValue + rightValue)
        case .subtract:
            return Binary(leftValue - rightValue)
        case .bitwiseOR:
            return Binary(leftValue | rightValue)
        case .bitwiseNOR:
            return Binary(~leftValue & ~rightValue)
        case .bitwiseXOR:
            return Binary(leftValue ^ rightValue)
        }
    }
}

import Foundation

enum ErrorCase: Error {
    case unknownInputCase
    case dividedByZero
}

enum AccessibleOperator: String {
    case plus = "+", minus = "-", multiply = "*", divide = "/"
}

enum CalculatorComponent {
    case number
    case `operator`
    case equalSign
    case allClear
    case clearEntry
    case signConverter
    case dot
    
    static func convertToComponentType(from userInput: String) throws -> Self {
        switch userInput {
        case "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "00", "." :
            return .number
        case "/", "*", "+", "-" :
            return .operator
        case "=" :
            return .equalSign
        case "AC" :
            return .allClear
        case "CE" :
            return .clearEntry
        case "⁺⁄₋" :
            return .signConverter
        default:
            throw ErrorCase.unknownInputCase
        }
    }
    
}

protocol Calculatorable {
    func convertToPostfixExpression(fromInfix input: [String]) -> [String]
    func calculatePostfixExpression(postfix: [String]) throws -> Double
}

extension Calculatorable {
    private func checkPriority(A a: String, isLowerThenB b: String) -> Bool {
        if ["+", "-"].contains(a), ["*", "/"].contains(b) {
            return true
        }
        return false
    }
    
    func makeInfixExpression(from: [String]) throws -> [String] {
        var infixExpression = [String]()
        var infixNumberString = ""
        var converterCount = 0
        
        for userInput in from {
            let userInputType = try? CalculatorComponent.convertToComponentType(from: userInput)
            
            switch userInputType {
            case .number:
                infixNumberString += userInput
            case .operator:
                converterCount = 0
                infixExpression.append(infixNumberString)
                infixExpression.append(userInput)
                infixNumberString = ""
            case .signConverter:
                converterCount += 1
                if converterCount % 2 == 1 {
                    infixNumberString = AccessibleOperator.minus.rawValue + infixNumberString
                } else {
                    infixNumberString.remove(at: infixNumberString.startIndex)
                }
            default:
                throw ErrorCase.unknownInputCase
            }
        }
        
        infixExpression.append(infixNumberString)
        
        return infixExpression
    }
    
    func convertToPostfixExpression(fromInfix input: [String]) -> [String] {
        var postfix = [String]()
        var stack = Stack()
        
        for currentElement in input {
            if let isNumber = Double(currentElement) {
                postfix.append(currentElement)
            } else {
                if let lastElement = stack.pop() {
                    if checkPriority(A: lastElement, isLowerThenB: currentElement) {
                        stack.push(element: lastElement)
                        stack.push(element: currentElement)
                    } else {
                        postfix.append(lastElement)
                        stack.push(element: currentElement)
                    }
                    
                } else {
                    stack.push(element: currentElement)
                }
            }
        }
        
        while stack.peek() != nil {
            if let element = stack.pop() {
                postfix.append(element)
            }
        }
        
        return postfix
    }
}


struct Calculator: Calculatorable {
	
	private let numberFormatter = NumberFormatter()
	private let zero = "0"
	private let maximumSignificantDigits = 20
	private let currentLocale = "en_US"
	
	init() {
		numberFormatter.numberStyle = .decimal
		numberFormatter.roundingMode = .halfUp
		numberFormatter.maximumSignificantDigits = maximumSignificantDigits
		if let USLocale = NSLocale().displayName(forKey: .countryCode, value: currentLocale) {
			numberFormatter.locale = NSLocale(localeIdentifier: USLocale) as Locale
		}
	}
	
	func calculatePostfixExpression(postfix: [String]) throws -> Double {
		var stack = Stack()
		var popedValueFromStack: Double {
			return Double(stack.pop() ?? zero) ?? .zero
		}
		
		for element in postfix {
			let elementType = AccessibleOperator.init(rawValue: element)
			switch elementType {
			case .plus:
				let next = popedValueFromStack
				let prev = popedValueFromStack
				stack.push(element: String(prev + next))
			case .minus:
				let next = popedValueFromStack
				let prev = popedValueFromStack
				stack.push(element: String(prev - next))
			case .multiply:
				let next = popedValueFromStack
				let prev = popedValueFromStack
				stack.push(element: String(prev * next))
			case .divide:
				let next = popedValueFromStack
				let prev = popedValueFromStack
                
				if next == .zero {
					throw ErrorCase.dividedByZero
				} else {
					stack.push(element: String(prev / next))
				}
			default:
				stack.push(element: element)
			}
		}
		
		return popedValueFromStack
	}
	
	func formatting(number: Double) -> String? {
		return numberFormatter.string(from: NSNumber(value: number))
	}
}

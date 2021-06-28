import Foundation
//
struct Calculator: Calculatorable {
	
	enum ErrorCase: Error {
		case dividedByZero
	}
	
	enum AccessibleOperator: String {
		case plus = "+", minus = "-", multiply = "*", divide = "/"
	}
	
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

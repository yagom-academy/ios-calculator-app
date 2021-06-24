import Foundation
//
struct Calculator: CalculatorDelegate {
    
    enum ErrorCase: Error {
        case dividedByZero
        case unknownInputCase
    }
    
    let numberFormatter = NumberFormatter()
    
    init() {
        numberFormatter.numberStyle = .decimal
        numberFormatter.roundingMode = .halfUp
        numberFormatter.maximumSignificantDigits = 20
        if let USLocale = NSLocale().displayName(forKey: .countryCode, value: "en_US") {
            numberFormatter.locale = NSLocale(localeIdentifier: USLocale) as Locale
        }
    }
    
 
    
    func convertToPostfixExpression(fromInfix input: [String]) -> [String] {
        var postfix = [String]()
        var numberString = ""
        var stack = Stack()
        
        for currentElement in input {
            let currentType = try? convertToComponentType(from: currentElement)
                        
            if currentType == .number {
                numberString += currentElement
            } else {
                postfix.append(numberString)
                numberString = ""
                
                if let checkedElement = stack.peek(),
                   let lastElement = stack.pop() {
                    
                    if ["*", "/"].contains(lastElement) {
                        postfix.append(lastElement)
                        stack.push(element: currentElement)
                    } else {
                        if ["+", "-"].contains(currentElement) {
                            postfix.append(lastElement)
                            stack.push(element: currentElement)
                        } else {
                            stack.push(element: lastElement)
                            stack.push(element: currentElement)
                        }
                    }
                } else {
                    stack.push(element: currentElement)
                }
            }
        }
        
        postfix.append(numberString)
        
        numberString = ""
        
        while stack.peek() != nil {
            if let element = stack.pop() {
                postfix.append(element)
            }
        }
        
        return postfix
    }
    
    
    func calculatePostfixExpression(postfix: [String]) -> NSNumber {
        var result = [String]()
        var stack = Stack()
        for element in postfix {
            let elementType = try? convertToComponentType(from: element)
            switch elementType {
            case .operator:
//                if let next = stack.pop(),
//                   let prev = stack.pop() {
//                    if element == "+" {
//                      stack.push(element: (Double(prev) + Double(next))
//                                    }
               
            default:
                stack.push(element: element)
            }
        }
    }
    


	
	func convertToComponentType(from userInput: String) throws -> CalculatorComponent {
		switch userInput {
		case "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "00" :
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
		case "." :
			return .dot
		default:
			throw ErrorCase.unknownInputCase
		}
	}
	
	func formatting(number: Int) -> String? {
		return numberFormatter.string(from: NSNumber(value: number))
	}
	
	func formatting(number: Double) -> String? {
		return numberFormatter.string(from: NSNumber(value: number))
	}
	
	func plus(prev: Int, next: Int) -> Int {
		return prev + next
	}
	
	func minus(prev: Int, next: Int) -> Int {
		return prev - next
	}
	
	func multiply(prev: Int, next: Int) -> Int {
		return prev * next
	}
	
	func divide(value: Int, by: Int) throws -> Double {
		if by == 0 {
			throw ErrorCase.dividedByZero
		} else {
			return Double(value) / Double(by)
			
		}
	}
	
	func plus(prev: Double, next: Double) -> Double {
		return prev + next
	}
	
	func minus(prev: Double, next: Double) -> Double {
		return prev - next
	}
	
	func multiply(prev: Double, next: Double) -> Double {
		return prev * next
	}
	
	func divide(value: Double, by: Double) throws -> Double {
		if by == 0 {
			throw ErrorCase.dividedByZero
		} else {
			return value / by
		}
	}
	
}

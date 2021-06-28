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
    
    init() {
        numberFormatter.numberStyle = .decimal
        numberFormatter.roundingMode = .halfUp
        numberFormatter.maximumSignificantDigits = 20
        if let USLocale = NSLocale().displayName(forKey: .countryCode, value: "en_US") {
            numberFormatter.locale = NSLocale(localeIdentifier: USLocale) as Locale
        }
    }
    
    func calculatePostfixExpression(postfix: [String]) throws -> Double {
        var stack = Stack()
        for element in postfix {
            let elementType = AccessibleOperator.init(rawValue: element)
            switch elementType {
            case .plus:
                let next = Double(stack.pop() ?? "0") ?? 0
                let prev = Double(stack.pop() ?? "0") ?? 0
                stack.push(element: String(prev + next))
            case .minus:
                let next = Double(stack.pop() ?? "0") ?? 0
                let prev = Double(stack.pop() ?? "0") ?? 0
                stack.push(element: String(prev - next))
            case .multiply:
                let next = Double(stack.pop() ?? "0") ?? 0
                let prev = Double(stack.pop() ?? "0") ?? 0
                stack.push(element: String(prev * next))
            case .divide:
                let next = Double(stack.pop() ?? "0") ?? 0
                let prev = Double(stack.pop() ?? "0") ?? 0
                if next == 0 {
                    throw ErrorCase.dividedByZero
                } else {
                    stack.push(element: String(prev / next))
                }
            default:
                stack.push(element: element)
            }
        }
        return Double(stack.pop() ?? "0") ?? 0
    }
    
    func formatting(number: Double) -> String? {
        return numberFormatter.string(from: NSNumber(value: number))
    }
}

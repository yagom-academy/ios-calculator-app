import Foundation
//
struct Calculator {
    let numberFormatter = NumberFormatter()
    
    init() {
        numberFormatter.numberStyle = .decimal
        numberFormatter.roundingMode = .halfUp
        numberFormatter.maximumSignificantDigits = 20
        if let USLocale = NSLocale().displayName(forKey: .countryCode, value: "en_US") {
            numberFormatter.locale = NSLocale(localeIdentifier: USLocale) as Locale
        }
    }

	enum ErrorCase: Error {
        case dividedByZero
        case unknownInputCase
    }
    
    enum Component {
        case number
        case `operator`
        case equalSign
        case allClear
        case clearEntry
        case signConverter
        case dot
    }
    
    func convertToComponentType(from userInput: String) throws -> Component {
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

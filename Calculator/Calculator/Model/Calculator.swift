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

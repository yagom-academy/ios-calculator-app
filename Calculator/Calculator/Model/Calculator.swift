import Foundation

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
    
    func plus(prev: Int, next: Int) -> String? {
        return  formatting(number: prev + next)
    }
    
    func minus(prev: Int, next: Int) -> String? {
        return formatting(number: prev - next)
    }
    
    func multiply(prev: Int, next: Int) -> String? {
        return formatting(number: prev * next)
    }
    
    func divide(value: Int, by: Int) throws -> String? {
        if by == 0 {
            throw ErrorCase.dividedByZero
        } else {
            return formatting(number: Double(value) / Double(by))
        }
    }
    
    func plus(prev: Double, next: Double) -> String? {
        return formatting(number: prev + next)
    }
    
    func minus(prev: Double, next: Double) -> String? {
        return formatting(number: prev - next)
    }
    
    func multiply(prev: Double, next: Double) -> String? {
        return formatting(number: prev * next)
    }
    
    func divide(value: Double, by: Double) throws -> String? {
        if by == 0 {
            throw ErrorCase.dividedByZero
        } else {
            return formatting(number: value / by)
        }
    }
    
}

import Foundation
class CalculatorNumberFormatter {
    static let shared: CalculatorNumberFormatter = CalculatorNumberFormatter()
    private let numberFormatter: NumberFormatter = NumberFormatter()
    private init() {
        numberFormatter.numberStyle = .decimal
        numberFormatter.roundingMode = .halfUp
        numberFormatter.usesSignificantDigits = true
        numberFormatter.maximumSignificantDigits = 20
    }
    
    func string(for obj: Any?) -> String? {
        return numberFormatter.string(for: obj)
    }
    
    func number(from string: String?) -> NSNumber? {
        guard let string = string?.filter({ $0 != Character(",") }) else {
            return nil
        }
        return numberFormatter.number(from: string)
    }
}

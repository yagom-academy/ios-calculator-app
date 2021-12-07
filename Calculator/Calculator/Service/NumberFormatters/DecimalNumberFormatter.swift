import Foundation

enum DecimalNumberFormatter {
    static func string(for obj: Any?) -> String? {
        let formatter = NumberFormatter()
        
        formatter.roundingMode = .ceiling
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 20
                
        return formatter.string(for: obj)
    }
}

import Foundation

class DecimalNumberFormatter {
    static let shared: NumberFormatter = {
        var instance = NumberFormatter()
        
        instance.roundingMode = .ceiling
        instance.numberStyle = .decimal
        instance.maximumFractionDigits = 20
        
        return instance
    }()
}

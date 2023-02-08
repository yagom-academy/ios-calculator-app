import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map { String($0) }
    }
    
    private func convertToDouble(appending number: String = "") -> Double {
        let addedNumber = (self + number).filter { $0 != "," }
        guard let doubleNumber = Double(addedNumber) else { return .zero }
        return doubleNumber
    }
    
    func convertToDecimal() -> String {
        let doubleNumber = self.convertToDouble()
        
        let numberFormatter =  NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.roundingMode = .halfUp
        numberFormatter.maximumFractionDigits = 20
        
        return numberFormatter.string(for: doubleNumber) ?? Sign.zero
    }
}

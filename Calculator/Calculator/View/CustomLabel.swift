import UIKit
//MARK: - NumberLabel
class NumberLabel: UILabel {
//MARK: - NumberLabel NameSpace
    private let initialValue: String = "0"
    private let zero: String = "0"
    private let doublyZero: String = "00"
    private let negativeNumberSign: String = "-"
    private let decimalPoints: Character = "."
//MARK: - NumberLabel Properties
    private var isPositiveNumber: Bool = true
    private var hasDecimalPoints: Bool = false
    
//MARK: - NumberLabel Func
    func append(_ number: String) {
        if self.text == initialValue {
            if number == zero || number == doublyZero {
                return
            }
            self.text = number
        } else {
            self.text?.append(number)
        }
    }
    
    func appendDecimalPoints() {
        if !hasDecimalPoints {
            self.text?.append(decimalPoints)
            hasDecimalPoints = true
        }
    }
    
    func swapNumberSign() {
        guard let number = self.text,
              number != initialValue else {
            return
        }
        if isPositiveNumber {
            self.text = negativeNumberSign + number
            isPositiveNumber = false
        } else {
            self.text?.removeFirst()
            isPositiveNumber = true
        }
    }
    
    func clearAll() {
        self.text = initialValue
        self.isPositiveNumber = true
        self.hasDecimalPoints = false
    }
}

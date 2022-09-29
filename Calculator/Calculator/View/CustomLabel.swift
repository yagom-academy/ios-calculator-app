import UIKit
//MARK: - NumberLabel
class NumberLabel: UILabel {
//MARK: - NumberLabel NameSpace
    private let initialValue: String = "0"
    private let zero: String = "0"
    private let doublyZero: String = "00"
    private let negativeNumberSign: String = "-"
//MARK: - NumberLabel Properties
    private var isPositiveNumber: Bool = true
    
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
    }
}

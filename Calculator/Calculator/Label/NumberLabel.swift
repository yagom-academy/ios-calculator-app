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
    var isReceiving: Bool {
        return self.text != initialValue ? true : false
    }
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
        if hasDecimalPoints == false {
            self.text?.append(decimalPoints)
            hasDecimalPoints = true
        }
    }
    
    func swapNumberSign() {
        guard let number = self.text,
              number != initialValue,
              isReceiving == true else {
            return
        }
        if isPositiveNumber == true {
            self.text = negativeNumberSign + number
            isPositiveNumber = false
        } else {
            self.text?.removeFirst()
            isPositiveNumber = true
        }
    }
}

//MARK: - extension Clearable
extension NumberLabel: InitializationProtocol {
    func Initialization() {
        self.text = initialValue
        self.isPositiveNumber = true
        self.hasDecimalPoints = false
    }
}

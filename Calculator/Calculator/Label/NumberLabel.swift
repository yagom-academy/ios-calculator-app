import UIKit

class NumberLabel: UILabel {
    //MARK: - NumberLabel NameSpace
    private let initialValue: String = "0"
    private let zero: String = "0"
    private let doublyZero: String = "00"
    private let negativeNumberSign: String = "-"
    private let decimalPoints: Character = "."
    
    //MARK: - NumberLabel Properties
    private var decimal: String = "" {
        didSet {
            self.text = integer + decimal
        }
    }
    private var integer: String = "0" {
        didSet {
            self.text = decimal + integer
        }
    }
    
    var isReceiving: Bool {
        return self.text != initialValue ? true : false
    }
    var isZero: Bool {
        guard let text = self.text,
              let number = Double(text.filter({$0 != ","})) else {
            return true
        }
        return number.isZero
    }
    private var isPositiveNumber: Bool {
        return integer.contains(negativeNumberSign) == false
    }
    private var hasDecimalPoints: Bool {
        return decimal.contains(decimalPoints)
    }
    
    //MARK: - NumberLabel Method
    func append(_ number: String) {
        guard var text = self.text,
              text.count <= 20 else {
            return
        }
        if isZero == true && hasDecimalPoints == false {
            if number == zero || number == doublyZero {
                return
            }
            self.integer = number
        } else if hasDecimalPoints == true {
            self.decimal += number
        } else {
            text.append(number)
            appendInteger(for: text)
        }
    }
    
    private func appendInteger(for numberOfString: String) {
        guard let number = CalculatorNumberFormatter.shared.number(from: numberOfString) else {
            return
        }
        self.integer = CalculatorNumberFormatter.shared.string(for: number)!
    }
    
    func appendDecimalPoints() {
        if hasDecimalPoints == false {
            self.decimal.append(decimalPoints)
        }
    }
    
    func swapNumberSign() {
        guard isZero == false,
              isReceiving == true else {
            return
        }
        if isPositiveNumber == true {
            self.integer = negativeNumberSign + self.integer
        } else {
            self.integer.removeFirst()
        }
    }
}

//MARK: - extension
extension NumberLabel: Resettable {
    func reset() {
        self.integer = initialValue
        self.decimal = ""
    }
}

import UIKit
class NumberLabel: UILabel {
    private let initialValue: String = "0"
    private let zero: String = "0"
    private let doublyZero: String = "00"
    
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
    
    func clearAll() {
        self.text = initialValue
    }
}

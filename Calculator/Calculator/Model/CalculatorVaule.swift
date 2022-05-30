struct CalculatorValue {
    private var inputNumber = ""
    private var inputOperator = ""
    private var arithmetic = ""
    private var isPositiveNumber = true
    
    var isNumberEmpty: Bool {
       return inputNumber.isEmpty
    }
    var isArithmeticEmpty: Bool {
        return arithmetic.isEmpty
    }
    
    mutating func updateInputNumber(with number: String) {
        if inputNumber.contains(".") && number == "." {
            return
        }
        
        if (inputNumber == "" || inputNumber == "0") && (number == "0" || number == "00") {
            inputNumber = "0"
        } else if inputNumber == "" && number == "." {
            inputNumber = "0."
        } else if inputNumber == "0" && number != "."{
            inputNumber = number
        } else {
            inputNumber += number
        }
    }
    
    mutating func resetCalculator() {
        arithmetic = ""
        isPositiveNumber = true
        resetInput(inputNumber: true, inputOperator: true)
    }
    
    mutating func resetInput(inputNumber: Bool, inputOperator: Bool) {
        if inputNumber {
            self.inputNumber = ""
        }
        
        if inputOperator {
            self.inputOperator = ""
        }
    }
    
    mutating func convertSign() {
        if inputNumber == "0" || isNumberEmpty {
            return
        }
        
        if isPositiveNumber {
            inputNumber = "-" + inputNumber
            isPositiveNumber = false
        } else {
            inputNumber = inputNumber.replacingOccurrences(of: "-", with: "")
            isPositiveNumber = true
        }
    }
}

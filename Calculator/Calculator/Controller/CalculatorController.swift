//  CalculatorController.swift
//  Created by zhilly on 2022/09/29.

class CalculatorController {
    let view: MainViewController
    let formula: Formula?
    var Expression: String = ""
    var viewDisplayNumber: String = ""
    var displaySign: Operator.RawValue = Operator.add.rawValue
    
    init() {
        self.view = MainViewController()
        self.formula = ExpressionParser.parse(from: Expression)
    }
    
    func isStartZero(stringNumber: String) -> Bool {
        if stringNumber.first == "0" {
            return true
        } else {
            return false
        }
    }
    
    func isOverCount20(stringNumber: String, input: String?) -> Bool {
        if input != "00" && stringNumber.count >= 20 {
            return true
        } else if input == "00" && stringNumber.count >= 19 {
            return true
        }
        return false
    }
    
    func tappedNumberButton(input: String?) -> String {
        if isOverCount20(stringNumber: viewDisplayNumber, input: input) {
            return viewDisplayNumber
        }
        
        if isStartZero(stringNumber: viewDisplayNumber) == true {
            viewDisplayNumber = input ?? ""
        } else {
            viewDisplayNumber += input ?? ""
        }
        
        return viewDisplayNumber
    }
    
    func tappedOperatorButton(input: String?) {
        determineOperator(stringOperator: input)
    }
    
    func determineOperator(stringOperator: String?) {
        switch stringOperator {
        case "+":
            displaySign = Operator.add.rawValue
        case "−":
            displaySign = Operator.subtract.rawValue
        case "×":
            displaySign = Operator.multiply.rawValue
        case "÷":
            displaySign = Operator.divide.rawValue
        default:
            displaySign = Operator.add.rawValue
        }
    }
    
    func tappedCEButton() {
        viewDisplayNumber.text = ""
    }
}

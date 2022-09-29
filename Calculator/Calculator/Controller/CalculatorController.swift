//  CalculatorController.swift
//  Created by zhilly on 2022/09/29.

class CalculatorController {
    let view: MainViewController
    let formula: Formula?
    var input: String = ""
    var viewDisplayNumber: String = ""
    
    init() {
        self.view = MainViewController()
        self.formula = ExpressionParser.parse(from: input)
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
}

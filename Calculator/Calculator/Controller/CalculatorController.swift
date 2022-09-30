//  CalculatorController.swift
//  Created by zhilly on 2022/09/29.

class CalculatorController {
    let view: MainViewController
    var formula: Formula?
    var Expression: String = ""
    var viewDisplayNumber: String = "0"
    var displaySign: Operator.RawValue = Operator.unknown.rawValue
    var isFirstClick: Bool = true
    
    init(view: MainViewController) {
        self.view = view
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
        var inputLimit: Int = 20
        if stringNumber.contains(".") == true {
            inputLimit += 1
        }
        
        if stringNumber.contains("-") == true {
            inputLimit += 1
        }
        
        if input != "00" && stringNumber.count >= inputLimit {
            return true
        } else if input == "00" && stringNumber.count >= inputLimit - 1 {
            return true
        }
        return false
    }
    
    func canMakeHorizontalStackView() -> Bool {
        if displaySign != " " && isStartZero(stringNumber: viewDisplayNumber) == false {
            return true
        }
        return false
    }
    
    func canChangedOperator() -> Bool {
        return isStartZero(stringNumber: viewDisplayNumber) ? true : false
    }
    
    func tappedNumberButton(input: String?) -> String {
        if isOverCount20(stringNumber: viewDisplayNumber, input: input) {
            return viewDisplayNumber
        }
        
        if isStartZero(stringNumber: viewDisplayNumber) == true && viewDisplayNumber.contains(".") == false {
            input == "00" ? (viewDisplayNumber = "0") : (viewDisplayNumber = input ?? "0")
        } else {
            viewDisplayNumber += input ?? "0"
        }
        
        isFirstClick = false
        return viewDisplayNumber
    }
    
    func tappedOperatorButton(input: String?) -> String {
        if isFirstClick == true {
            return ""
        } else if canChangedOperator() == true {
            determineOperator(stringOperator: input)
            return String(displaySign)
        } else {
            Expression += String(displaySign) + viewDisplayNumber
            viewDisplayNumber = "0"
            view.makeStakView()
            view.resetDisplayNumberLabel()
            determineOperator(stringOperator: input)
            return String(displaySign)
        }
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
        viewDisplayNumber = "0"
        view.displayNumberLabel.text = "0"
        displaySign = Operator.unknown.rawValue
        view.displaySignLabel.text = ""
        Expression = ""
    }
    
    func tappedCalculateButton() -> String {
        Expression += String(displaySign) + viewDisplayNumber
        Expression = Expression.trimmingCharacters(in: .whitespaces)
        view.makeStakView()
        view.resetDisplayNumberLabel()
        self.formula = ExpressionParser.parse(from: Expression)
        let result = self.formula?.result() ?? .nan
        
        return String(result)
    }
    
    func tappedDotButton() -> String {
        if viewDisplayNumber.contains(".") == true {
            return viewDisplayNumber
        } else {
            viewDisplayNumber += "."
            return viewDisplayNumber
        }
    }
    
    func tappedACButton() {
        Expression = ""
        viewDisplayNumber = "0"
        displaySign = Operator.unknown.rawValue
        isFirstClick = true
    }
    
    func tappedReverseSignButton() -> String {
        if viewDisplayNumber.first == "-" {
            viewDisplayNumber = viewDisplayNumber.trimmingCharacters(in: ["-"])
        } else {
            viewDisplayNumber = viewDisplayNumber.trimmingCharacters(in: ["-","0"])
            viewDisplayNumber = "-" + viewDisplayNumber
        }
        return viewDisplayNumber
    }
}

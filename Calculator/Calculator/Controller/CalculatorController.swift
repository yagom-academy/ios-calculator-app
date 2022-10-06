//  CalculatorController.swift
//  Created by zhilly and Gundy on 2022/10/04.

final class CalculatorController {
    let view: MainViewControllerDelegate
    private var expression: String = ""
    var viewDisplayNumber: String = "0"
    private var displaySign: Operator = Operator.unknown
    private var isFirstClick: Bool = true
    private var canCalculate: Bool = false
    var calculatedNumber: String = ""
    
    init(view: MainViewControllerDelegate) {
        self.view = view
    }
    
    private func isFirstCharacterZero(stringNumber: String) -> Bool {
        if stringNumber == "0" {
            return true
        } else {
            return false
        }
    }
    
    private func isOverExpressionLimit(stringNumber: String, input: String?) -> Bool {
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
    
    private func canMakeHorizontalStackView() -> Bool {
        if displaySign.rawValue != " " && isFirstCharacterZero(stringNumber: viewDisplayNumber) == false {
            return true
        }
        
        return false
    }
    
    private func canChangedOperator() -> Bool {
        return isFirstCharacterZero(stringNumber: viewDisplayNumber) ? true : false
    }
    
    func tappedNumberButton(input: String?) -> String {
        if isOverExpressionLimit(stringNumber: viewDisplayNumber, input: input) {
            return viewDisplayNumber
        }
        
        if isFirstCharacterZero(stringNumber: viewDisplayNumber) == true &&
            viewDisplayNumber.contains(".") == false
        {
            input == "00" ? (viewDisplayNumber = "0") : (viewDisplayNumber = input ?? "0")
        } else {
            viewDisplayNumber += input ?? "0"
        }
        
        canCalculate = true
        isFirstClick = false
        
        return viewDisplayNumber
    }
    
    func tappedOperatorButton(input: String?) -> String {
        if calculatedNumber != "" {
            view.makeStackView()
            view.resetDisplayNumberLabel()
            determineOperator(stringOperator: input)
            
            return String(displaySign.rawValue)
        }
        
        if isFirstClick == true {
            return ""
        } else if canChangedOperator() == true {
            determineOperator(stringOperator: input)
            
            return String(displaySign.rawValue)
        } else {
            expression += String(displaySign.rawValue) + viewDisplayNumber
            view.makeStackView()
            view.resetDisplayNumberLabel()
            determineOperator(stringOperator: input)
            
            return String(displaySign.rawValue)
        }
    }
    
    private func determineOperator(stringOperator: String?) {
        switch stringOperator {
        case "+":
            displaySign = Operator.add
        case "−":
            displaySign = Operator.subtract
        case "×":
            displaySign = Operator.multiply
        case "÷":
            displaySign = Operator.divide
        default:
            displaySign = Operator.unknown
        }
    }
    
    func tappedCEButton() {
        viewDisplayNumber = "0"
        view.displayNumberLabel.text = "0"
        calculatedNumber = ""
        
        if view.displaySignLabel.text == "" {
            displaySign = Operator.unknown
            view.displaySignLabel.text = ""
            expression = ""
        }
    }
    
    private func calculateResult() -> String {
        expression += String(displaySign.rawValue) + viewDisplayNumber
        expression = expression.trimmingCharacters(in: .whitespaces)
        canCalculate = false
        view.makeStackView()
        view.resetDisplayNumberLabel()
        var formula = ExpressionParser.parse(from: expression)
        
        do {
            let result = try formula.result()
            calculatedNumber = String(result)
            return String(result)
        } catch {
            return error.localizedDescription
        }
    }
    
    func tappedCalculateButton() -> String? {
        if canCalculate == true {
            isFirstClick = true
            return calculateResult()
        } else {
            return view.displayNumberLabel.text
        }
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
        expression = ""
        viewDisplayNumber = "0"
        calculatedNumber = ""
        displaySign = Operator.unknown
        isFirstClick = true
    }
    
    func tappedReverseSignButton() -> String {
        if viewDisplayNumber == "0" {
            return viewDisplayNumber
        }
        
        if viewDisplayNumber.first == "-" {
            viewDisplayNumber = viewDisplayNumber.trimmingCharacters(in: ["-"])
        } else {
            viewDisplayNumber = "-" + viewDisplayNumber
        }
        
        return viewDisplayNumber
    }
}

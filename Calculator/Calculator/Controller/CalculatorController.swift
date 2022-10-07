//  CalculatorController.swift
//  Created by zhilly and Gundy on 2022/10/04.

final class CalculatorController: CalculatorControllerProtocol {
    let view: CalculatorViewDelegate
    var viewDisplayNumber: String = String(Int.zero)
    private var expression: String = String()
    private var calculatedNumber: String = String()
    private var displaySign: Operator = Operator.unknown
    private var isFirstClick: Bool = true
    private var canCalculate: Bool = false
    
    init(view: CalculatorViewDelegate) {
        self.view = view
    }
    
    private func isFirstCharacterZero(stringNumber: String) -> Bool {
        if stringNumber == String(Int.zero) {
            return true
        } else {
            return false
        }
    }
    
    private func isOverExpressionLimit(stringNumber: String, input: String?) -> Bool {
        var inputLimit: Int = 20
        
        if stringNumber.contains(Constants.dot) == true {
            inputLimit += 1
        }
        
        if stringNumber.contains(Constants.negativeSign) == true {
            inputLimit += 1
        }
        
        if input != Constants.doubleZero && stringNumber.count >= inputLimit {
            return true
        } else if input == Constants.doubleZero && stringNumber.count >= inputLimit - 1 {
            return true
        }
        
        return false
    }
    
    private func canMakeHorizontalStackView() -> Bool {
        if displaySign.rawValue != Constants.whitespace && isFirstCharacterZero(stringNumber: viewDisplayNumber) == false {
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
            viewDisplayNumber.contains(Constants.dot) == false
        {
            input == Constants.doubleZero ? (viewDisplayNumber = String(Int.zero)) : (viewDisplayNumber = input ?? String(Int.zero))
        } else {
            viewDisplayNumber += input ?? String(Int.zero)
        }
        
        canCalculate = true
        isFirstClick = false
        
        return viewDisplayNumber
    }
    
    func tappedOperatorButton(input: String?) -> String {
        if calculatedNumber != String() {
            view.makeStackView()
            view.resetDisplayNumberLabel()
            determineOperator(stringOperator: input)
            
            return String(displaySign.rawValue)
        }
        
        if isFirstClick == true {
            return String()
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
        viewDisplayNumber = String(Int.zero)
        view.displayNumberLabel.text = String(Int.zero)
        calculatedNumber = String()
        
        if view.displaySignLabel.text == String() {
            displaySign = Operator.unknown
            view.displaySignLabel.text = String()
            expression = String()
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
        if viewDisplayNumber.contains(Constants.dot) == true {
            return viewDisplayNumber
        } else {
            viewDisplayNumber += Constants.dot
            
            return viewDisplayNumber
        }
    }
    
    func tappedACButton() {
        expression = String()
        viewDisplayNumber = String(Int.zero)
        calculatedNumber = String()
        displaySign = Operator.unknown
        isFirstClick = true
    }
    
    func tappedReverseSignButton() -> String {
        if viewDisplayNumber == String(Int.zero) {
            return viewDisplayNumber
        }
        
        if viewDisplayNumber.first == Character(Constants.negativeSign) {
            viewDisplayNumber = viewDisplayNumber.split(with: Character(Constants.negativeSign)).joined()
        } else {
            viewDisplayNumber = Constants.negativeSign + viewDisplayNumber
        }
        
        return viewDisplayNumber
    }
}

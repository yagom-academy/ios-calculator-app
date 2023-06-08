//
//  InputProcessor.swift
//  Calculator
//
//  Created by Minsup on 2023/06/08.
//

enum Sign: Character {
    case plus = "+"
    case minus = "-"
}

class InputProcessor {
    private var expression: String = ""
    
    private var operandOnInput: String {
        DisplayFormatter.stringToInput(from: getRecentOperand())
    }
    
    private var operandOnResult: String {
        DisplayFormatter.stringToResult(from: getRecentOperand())
    }
    
    func inputOperand(_ element: String) -> String {
        if element == "." && operandOnInput.contains(".") { return self.operandOnInput }
        self.expression.append(element)
        
        return self.operandOnInput
    }
    
    func inputOperator(_ element: String, record: (String, String) -> Void) -> String {
        guard let last = self.expression.last else { return "" }
        
        if Operator.all.contains(last) {
            self.expression.removeLast()            
        } else {
            let expression = self.generateExpression()
            record(expression.`operator`, expression.operand)
        }
        self.expression.append(element)
        return element
    }
    
    func toggleSign() -> String {
        let lastOperatorIndex = self.expression.lastIndex(where: { Operator.all.contains(String($0))}) ?? self.expression.startIndex
        let dotIndex = lastOperatorIndex == self.expression.startIndex ?
            self.expression.startIndex :
            self.expression.index(after: lastOperatorIndex)
        
        if getRecentOperand().contains(Sign.minus.rawValue) {
            self.expression.remove(at: dotIndex)
        } else {
            self.expression.insert(Sign.minus.rawValue, at: dotIndex)
        }
        return self.operandOnInput
    }
    
    func allClear() {
        self.expression = ""
    }
    
    func clearLastOperand() {
        if let lastOperatorIndex = self.expression.lastIndex(where: { Operator.all.contains(String($0))})  {
            self.expression = String(self.expression[...lastOperatorIndex])
        } else {
            self.expression = ""
        }
    }
    
    func getResult(record: (String, String) -> Void) -> String {
        let expression = self.generateExpression()
        if expression.operator.isNotEmpty {
            record(expression.`operator`, expression.operand)
        }

        do {
            var formula = ExpressionParser.parse(from: self.expression)
            let result = try formula.result()
            self.expression = String(result)
            return DisplayFormatter.stringToResult(from: result)
        } catch {
            return self.operandOnInput
        }        
    }
    
    private func generateExpression() -> (`operator`: String, operand: String) {
        if let `operator` = self.expression.last(where: {Operator.all.contains(String($0))})  {
            return (String(`operator`), self.operandOnResult)
        } else {
            return ("", self.operandOnResult)
        }
    }
    
    private func getRecentOperand() -> String {
        if let lastOperatorIndex = self.expression.lastIndex(where: { Operator.all.contains(String($0))}) {
            let startIndex = self.expression.index(after: lastOperatorIndex)
            let substring = self.expression[startIndex...]
            let result = String(substring)
            return result
        }
        return self.expression
    }
}

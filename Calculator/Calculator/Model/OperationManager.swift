//
//  OperationManager.swift
//  Calculator
//
//  Created by Erick on 2023/06/11.
//

import Foundation

class OperationManager {
    private var formula: String = ""
    private var isCalculate: Bool = false
    private let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 11
        numberFormatter.maximumIntegerDigits = 12
        
        return numberFormatter
    }()
    
    func calculateFormula() -> String {
        var parsedFormula = ExpressionParser.parse(from: formula)
        guard let result = numberFormatter.string(for: parsedFormula.result()) else { return "Error" }
        isCalculate = true
        clearFormula()
        
        return result
    }
    
    @discardableResult
    func addFormula(_ operatror: String, _ operands: String) -> (String, String) {
        let currentOperands = operands.replacingOccurrences(of: ",", with: "")
        let `operator` = operatror
        
        guard let number = Double(currentOperands),
              let operands = numberFormatter.string(for: number) else { return ("", "") }
        
        if formula.isEmpty && operands != CalculatorTerms.zero.rawValue  {
            formula += "\(number) "
            return ("", operands)
        } else if operands != CalculatorTerms.zero.rawValue {
            formula += "\(`operator`) \(number) "
            return (`operator`, operands)
        }
        
        if `operator` == String(Operator.divide.rawValue) && operands == CalculatorTerms.zero.rawValue {
            formula += "\(`operator`) \(operands) "
        }
        
        return ("", "")
    }
    
    func addOperandsLabel(_ currentOperands: String, _ inputOperands: String) -> String {
        let numberOperands = isCalculate ? CalculatorTerms.zero.rawValue : currentOperands.replacingOccurrences(of: ",", with: "")
        
        guard let number = Double(numberOperands + inputOperands),
              let operands = numberFormatter.string(for: number) else { return currentOperands }
        
        if operands.filter({ $0 == "," }).count == 4 || numberOperands.count >= 13 {
            return currentOperands
        }
        
        if numberOperands.contains(CalculatorTerms.decimalPoint.rawValue) && (inputOperands == CalculatorTerms.zero.rawValue || inputOperands == CalculatorTerms.doubleZero.rawValue) {
            let result = numberOperands + inputOperands
            return result
        } else if !numberOperands.contains(CalculatorTerms.decimalPoint.rawValue) && inputOperands == CalculatorTerms.decimalPoint.rawValue {
            let result = operands + inputOperands
            return result
        }
        
        isCalculate = false
        return operands
    }
    
    func changeSign(_ operands: String) -> String {
        var operands = operands
        guard operands != CalculatorTerms.zero.rawValue else { return CalculatorTerms.zero.rawValue }
        
        if operands.contains(CalculatorTerms.minusSign.rawValue) {
            operands.removeFirst()
        } else {
            operands.insert(Character(CalculatorTerms.minusSign.rawValue), at: operands.startIndex)
        }
        
        return operands
    }
    
    func clearFormula() {
        formula = ""
    }
}

//
//  OperationManager.swift
//  Calculator
//
//  Created by Erick on 2023/06/11.
//

import Foundation

struct OperationManager {
    private var formula: String = ""
    private var isCalculate: Bool = false
    private let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 11
        numberFormatter.maximumIntegerDigits = 12
        
        return numberFormatter
    }()
    
    mutating func calculateFormula() -> String {
        var parsedFormula = ExpressionParser.parse(from: formula)
        guard let result = numberFormatter.string(for: parsedFormula.result()) else { return "Error" }
        isCalculate = true
        clearFormula()
        
        return result
    }
    
    @discardableResult
    mutating func addFormula(_ operatror: String, _ operands: String) -> (String, String) {
        let currentOperands = operands.replacingOccurrences(of: ",", with: "")
        let `operator` = operatror
        
        guard let number = Double(currentOperands),
              let operands = numberFormatter.string(for: number) else { return ("", "") }
        
        if formula.isEmpty && operands != CalculatorNamespace.Zero  {
            formula += "\(number) "
            return ("", operands)
        } else if operands != CalculatorNamespace.Zero {
            formula += "\(`operator`) \(number) "
            return (`operator`, operands)
        }
        
        if `operator` == String(Operator.divide.rawValue) && operands == CalculatorNamespace.Zero {
            formula += "\(`operator`) \(operands) "
        }
        
        return ("", "")
    }
    
    mutating func addOperandsLabel(_ currentOperands: String, _ inputOperands: String) -> String {
        let numberOperands = isCalculate ? CalculatorNamespace.Zero : currentOperands.replacingOccurrences(of: ",", with: "")
        
        guard let number = Double(numberOperands + inputOperands),
              let operands = numberFormatter.string(for: number) else { return currentOperands }
        
        if operands.filter({ $0 == "," }).count == 4 || numberOperands.count >= 13 {
            return currentOperands
        }
        
        if numberOperands.contains(CalculatorNamespace.Dot) && (inputOperands == CalculatorNamespace.Zero || inputOperands == CalculatorNamespace.DoubleZero) {
            let result = numberOperands + inputOperands
            return result
        } else if !numberOperands.contains(CalculatorNamespace.Dot) && inputOperands == CalculatorNamespace.Dot {
            let result = operands + inputOperands
            return result
        }
        
        isCalculate = false
        return operands
    }
    
    func changeSign(_ operands: String) -> String {
        var operands = operands
        guard operands != CalculatorNamespace.Zero else { return CalculatorNamespace.Zero }
        
        if operands.contains(CalculatorNamespace.Negative) {
            operands.removeFirst()
        } else {
            operands.insert(Character(CalculatorNamespace.Negative), at: operands.startIndex)
        }
        
        return operands
    }
    
    mutating func clearFormula() {
        formula = ""
    }
}

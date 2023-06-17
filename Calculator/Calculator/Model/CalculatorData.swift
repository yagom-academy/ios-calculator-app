//
//  CalculatorData.swift
//  Calculator
//
//  Created by kyungmin, EtialMoon on 2023/06/17.
//

struct CalculatorData {
    private(set) var formulaString = ""
    
    mutating func resetFormulaString() {
        formulaString = ""
    }
    
    mutating func addFormulaString(_ operatorText: String, _ operandText: String) {
        formulaString += operatorText + operandText.replacingOccurrences(of: ",", with: "")
    }
}

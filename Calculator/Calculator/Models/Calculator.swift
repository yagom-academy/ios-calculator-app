//
//  Calculator.swift
//  Calculator
//
//  Created by 노유빈 on 2022/09/29.
//

class Calculator {
    private(set) var formula = ""
    private var calculationState = false
    var isCalculateCompleted: Bool {
        get {
            return calculationState
        }
        
        set(state) {
            self.calculationState = state
        }
    }
    
    init(formula: String = "", calculationState: Bool = false) {
        self.formula = formula
        self.calculationState = calculationState
    }
    
    func initFormula() {
        formula = ""
    }
    
    func addFormula(_ formula: String) {
        self.formula += formula.replacingOccurrences(of: ",", with: "")
    }
    
    func calculate() throws -> Double {
        var convertedFormula = ExpressionParser.parser(from: formula)
        let result = try convertedFormula.result()
        
        initFormula()
        isCalculateCompleted = true
        
        return result
    }
}

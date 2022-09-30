//
//  Calculator.swift
//  Calculator
//
//  Created by 노유빈 on 2022/09/29.
//

class Calculator {
    private(set) var `operator` = ""
    private(set) var operand = ""
    private(set) var formula = ""
    private var calculationState = false
    
    var isFormulaEmpty: Bool {
        return formula.count == 0
    }
    
    var isCalculateCompleted: Bool {
        get {
            return calculationState
        }
        
        set(state) {
            self.calculationState = state
        }
    }
    
    init(`operator`: String = "", operand: String = "", formula: String = "", calculationState: Bool = false) {
        self.operator = `operator`
        self.operand = operand
        self.formula = formula
        self.calculationState = calculationState
    }
    
    func initCalculation() {
        self.operator = ""
        self.operand = ""
        self.formula = ""
    }
    
    func changeOperator(_ `operator`: String) {
        self.operator = `operator`
    }
    
    func changeOperand(_ operand: String) {
        self.operand = operand
    }
    
    func addFormula() {
        self.formula += self.operator + self.operand
    }
    
    func calculate() throws -> Double {
        var convertedFormula = ExpressionParser.parser(from: formula)
        let result = try convertedFormula.result()
        
        initCalculation()
        calculationState = true
        
        return result
    }
}

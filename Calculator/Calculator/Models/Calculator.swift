//
//  Calculator.swift
//  Calculator
//
//  Created by 노유빈 on 2022/09/29.
//

class Calculator {
    private(set) var `operator` = ""
    private(set) var operand = "0"
    private(set) var formula = ""
    private var calculationState = false
    
    var isOperandZero: Bool {
        return operand == "0"
    }
    
    var isFormulaEmpty: Bool {
        return formula == ""
    }
    
    var isCalculateCompleted: Bool {
        get {
            return calculationState
        }
        
        set(state) {
            self.calculationState = state
        }
    }
    
    var isOperandNegative: Bool {
        return operand.contains(MathSymbol.negative)
    }
    
    var isOperandDecimal: Bool {
        return operand.contains(MathSymbol.decimalPoint)
    }
    
    init(`operator`: String = "", operand: String = "", formula: String = "", calculationState: Bool = false) {
        self.operator = `operator`
        self.operand = operand
        self.formula = formula
        self.calculationState = calculationState
    }
    
    func initCalculation() {
        self.operator = ""
        self.operand = "0"
        self.formula = ""
    }
    
    func changeOperator(_ `operator`: String = "") {
        self.operator = `operator`
    }
    
    func changeOperand(_ operand: String = "0") {
        self.operand = operand
    }
    
    func addFormula() {
        if formula.isEmpty {
            self.formula = self.operand
        } else {
            self.formula += self.operator + self.operand
        }
    }
    
    func calculate() throws -> Double {
        var convertedFormula = ExpressionParser.parser(from: formula)
        let result = try convertedFormula.result()
        
        initCalculation()
        isCalculateCompleted = true
        
        return result
    }
}

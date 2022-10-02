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
    
    var isOperandZero: Bool {
        return operand == "0"
    }
    
    var isFormulaEmpty: Bool {
        return formula == ""
    }
    
    var isOperandNegative: Bool {
        return operand.contains(MathSymbol.negative)
    }
    
    var isOperandDecimal: Bool {
        return operand.contains(MathSymbol.decimalPoint)
    }
    
    init(`operator`: String = "", operand: String = "0", formula: String = "") {
        self.operator = `operator`
        self.operand = operand
        self.formula = formula
    }
    
    func initCalculation(`operator`: String = "", operand: String = "0", formula: String = "") {
        self.operator = `operator`
        self.operand = operand
        self.formula = formula
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
        var result = 0.0
        
        do {
            result = try convertedFormula.result()
            initCalculation(operand: String(result))
        } catch {
            initCalculation()
            throw error
        }
        
        return result
    }
}

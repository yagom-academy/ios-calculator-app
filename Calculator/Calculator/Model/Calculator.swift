//
//  Calculator.swift
//  Calculator
//
//  Created by rhovin, LJ on 2022/10/05.
//

class Calculator {
    private(set) var expression: String = ""
    private(set) var currentOperator: String = ""
    private(set) var currentOperand: String = ""
    
    var isNegativeOperand: Bool {
        return currentOperand.contains(MathSymbol.negative)
    }
    
    var isDecimal: Bool {
        return currentOperand.contains(MathSymbol.dot)
    }
    
    var isOperandEmpty: Bool {
        return currentOperand.isEmpty
    }
    
    func clearCalculator(expression: String = "",
                         currentOperator: String = "",
                         currentOperand: String = "") {
        self.expression = expression
        self.currentOperator = currentOperator
        self.currentOperand = currentOperand
    }
    
    func calculatedResult() throws -> Double {
        var result: Double = 0
        var formula: Formula = ExpressionParser.parser(from: expression)
        
        do {
            result = try formula.result()
            clearCalculator(currentOperand: String(result))
        } catch CalculatorError.queueIsEmpty {
            clearCalculator()
            print(CalculatorError.queueIsEmpty.description)
        } catch CalculatorError.divisionByZero {
            clearCalculator()
            throw CalculatorError.divisionByZero
        } catch {
            clearCalculator()
            print(CalculatorError.unknown.description)
        }

        return result
    }

    func updateCurrentOperand(_ number: String) {
        currentOperand = number
    }
    
    func updateCurrentOperator(_ `operator`: String) {
        currentOperator = `operator`
    }
    
    func updateExpression() {
        expression += currentOperator + currentOperand
    }
}

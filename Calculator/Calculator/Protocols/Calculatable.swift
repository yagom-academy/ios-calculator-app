//
//  Calculatable.swift
//  Calculator
//
//  Created by 박병호 on 2021/11/25.
//

import Foundation

protocol Calculatable {
    var formulaStack: [String] { get set }
    var currentOperand: String { get set }
    var currentOperator: String { get set }
    var currentOperandIsZero: Bool { get }
    var currentOperandIsNotZero: Bool { get }
    var historyStackIsNotEmpty: Bool { get }
    
    mutating func clearHistoryStack()
    mutating func updateCurrentOperandValue(to newOperand: String)
    mutating func updateCurrentOperatorValue(to newOperator: String)
    mutating func updateFormulaList()
    func calculateResult() -> Double
    func getCalculationResult(from formula: inout Formula) -> Double
}

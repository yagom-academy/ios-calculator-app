//
//  CalculatorManager.swift
//  Calculator
//
//  Created by 권나영 on 2021/11/23.
//

import Foundation

protocol CalculatorManagerDelegate {
    func updateOperandLabel(by newOperand: String)
    func updateOperatorLabel(by newOperator: String)
}

struct CalculatorManager {
    
    //MARK: - Properties
    
    private var inputOperand: String = "0" {
        didSet {
            delegate?.updateOperandLabel(by: inputOperand)
        }
    }
    private var inputOperator: String = ""
    private var hasCalculated: Bool = false
    
    var delegate: CalculatorManagerDelegate?
    
    mutating func tapNumberPad(_ operand: String) {
        if inputOperand == "0" {
            delegate?.updateOperandLabel(by: operand)
            inputOperand = operand
            return
        }
        inputOperand += operand
    }
    
    mutating func tapOperatorButton(_ `operator`: String) {
        delegate?.updateOperatorLabel(by: `operator`)
    }
    
    mutating func tapDotButton() {
        if inputOperand.contains(".") {
            return
        }
        inputOperand += "."
        delegate?.updateOperandLabel(by: inputOperand)
    }
    
    mutating func tapPlusMinusButton() {
        if inputOperand.hasPrefix("-") {
            inputOperand = inputOperand.replacingOccurrences(of: "-", with: "")
        } else {
            inputOperand = "-" + inputOperand
        }
    }
}

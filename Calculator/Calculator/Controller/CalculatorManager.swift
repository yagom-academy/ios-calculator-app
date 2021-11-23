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
    
    private var inputOperand: String = ""
    private var inputOperator: String = ""
    private var hasCalculated: Bool = false
    
    var delegate: CalculatorManagerDelegate?
    
    mutating func updateOperandLabel() {
        if hasCalculated {
            return
        }
        delegate?.updateOperandLabel(by: inputOperand)
    }
    
    mutating func updateOperatorLabel() {
        delegate?.updateOperatorLabel(by: inputOperator)
    }
}

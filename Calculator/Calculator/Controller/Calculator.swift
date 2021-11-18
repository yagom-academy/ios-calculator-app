//
//  Calculator.swift
//  Calculator
//
//  Created by Jae-hoon Sim on 2021/11/18.
//

import Foundation

class Calculator {
    var delegate: CalculatorDelegate?
}

// MARK:- Receiving Events
extension Calculator {
    func allClearButtonDidTap() {
        delegate?.clearToInitialState()
    }
    func clearEntryButtonDidTap() {
        
    }
    func toggleSignButtonDidTap() {
        
    }
    func operatorButtonDidTap(operator: String) {
        
    }
    func equalsButtonDidTap() {
        
    }
    func dotButtonDidTap() {
        
    }
    func zeroButtonDidTap() {
        
    }
    func doubleZeroButtonDidTap() {
        
    }
    func digitButtonDidTap(number: String) {
        
    }
}

// MARK:- Delegate Requirements
protocol CalculatorDelegate {
    func clearToInitialState()
}

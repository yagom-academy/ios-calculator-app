//
//  OperandEntry.swift
//  Calculator
//
//  Created by Jae-hoon Sim on 2021/11/16.
//

import Foundation

struct OperandEntry {
    var currentOperand: String {
        isPositive ? entry : "-" + entry
    }
    private var entry = "0"
    private var isPositive = true
    private var isZeroState: Bool { entry == "0" }
    private var isResultState = false
    mutating func append(_ input: String) {
        if isResultState {
            replace(with: input)
            return
        }
        switch input {
            case "0" where isZeroState,
                 "00" where isZeroState:
                return
            default:
                entry = isZeroState ? input : entry + input
        }
    }
    mutating func replace(with result: String) {
        isResultState.toggle()
        clear()
        append(result)
    }
    mutating func toggleSign() {
        if isZeroState { return }
        isPositive.toggle()
    }
    mutating func clear() {
        entry = "0"
    }
}

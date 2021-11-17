//
//  OperandEntry.swift
//  Calculator
//
//  Created by Jae-hoon Sim on 2021/11/16.
//

import Foundation

struct OperandEntry {
    var currentOperand: String {
        if isNonInputState { return "0" }
        return isPositive ? entry : "-" + entry
    }
    private var entry = ""
    private var isPositive = true
    var last: Character? { entry.last }
    var isNonInputState: Bool { entry == "" }
    private var isZeroState: Bool { entry == "0" }
    private var isDotState: Bool { entry.contains(".") }
    private var isResultState = false
    mutating func append(_ input: String) {
        if isResultState {
            replace(with: input)
            return
        }
        switch input {
            case "00" where isNonInputState:
                append("0")
                return
            case "0" where isZeroState,
                 "00" where isZeroState:
                return
            case "." where isDotState:
                return
            case "." where isNonInputState:
                append("0.")
            default:
                entry = isNonInputState ? input : entry + input
        }
    }
    mutating func replace(with result: String) {
        isResultState.toggle()
        clear()
        append(result)
    }
    mutating func toggleSign() {
        if isNonInputState { return }
        isPositive.toggle()
    }
    mutating func clear() {
        entry = ""
    }
}

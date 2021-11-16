//
//  OperandEntry.swift
//  Calculator
//
//  Created by Jae-hoon Sim on 2021/11/16.
//

import UIKit

protocol EntryDelegate {
    var calculatorController: ViewController? { get set }
    
    func appendToEntry(_ input: String)
}

class OperandEntry {
    var calculatorController: ViewController?
    
    private var entry = "0"
    private var isPositive = true {
        didSet {
//            calculatorController
        }
    }
    private var isZeroState: Bool {
        switch entry {
            case "", "0":
                return true
            default:
                return false
        }
    }
    
    private func updateEntryLabel() {
        
    }
}

extension OperandEntry: EntryDelegate {
    func appendToEntry(_ input: String) {
        switch input {
            case "0" where isZeroState,
                 "00" where isZeroState:
                return
            default:
                entry += input
        }
    }
    func toggleSign() {
        isPositive.toggle()
    }
    func emptyEntry() {
        entry.removeAll()
    }
}

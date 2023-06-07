//
//  Calculator - CalculatorViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    private var currentOperand: String = ""
    private var currentOperator: String = ""
    private var formula: String = "" {
        didSet {
            print(formula)
        }
    }
    
    override func viewDidLoad() {
        self.updateOperandWithDisplay(by: Symbol.empty)
        self.operatorLabel.text = Symbol.empty
    }
    
    @IBAction private func tapNumberButton(_ sender: UIButton) {
        self.setFormula(when: .tapNumberButton)
        self.updateOperandWithDisplay(by: sender.unwrappedTitle)
    }
    
    @IBAction private func tapDecimalPointButton(_ sender: UIButton) {
        self.updateOperandWithDisplay(by: Symbol.dot)
    }
    
    
    @IBAction private func tapOperatorButton(_ sender: UIButton) {
        self.setFormula(when: .tapOperatorButton)
        self.currentOperator = sender.sign
        self.operatorLabel.text = sender.sign
    }

    
    @IBAction private func tapEqualButton(_ sender: UIButton) {
        do {
            self.setFormula(when: .tapEqualButton)
            var parsedFormula = ExpressionParser.parse(from: self.formula)
            let result = try parsedFormula.result()
            self.displayLabel.text = DisplayFormatter.string(from: result)
        } catch CalculationError.divisionByZero {
            self.displayLabel.text = Error.nan
        } catch {
            
        }
    }
    
    @IBAction private func tapAllClearButton(_ sender: UIButton) {
        self.allClear()
    }
    
    
    @IBAction private func tapClearEntryButton(_ sender: UIButton) {
        self.updateOperandWithDisplay(by: Symbol.empty)
    }
    
    @IBAction private func tapSignChangeButton(_ sender: UIButton) {
        self.toggleSign()
    }
    
    private func updateOperandWithDisplay(by newElement: String) {
        switch newElement {
        case Symbol.empty:
            self.currentOperand = Symbol.empty
            self.displayLabel.text = Number.zero
            
        case Number.all:
            guard currentOperand.count < 20 else { return }
            self.currentOperand.append(newElement)
            self.displayLabel.text = DisplayFormatter.string(from: self.currentOperand)
            
        case Symbol.dot:
            guard currentOperand.count < 19 else { return }
            guard !self.currentOperand.contains(Symbol.dot) else { return }
            self.currentOperand.append(self.currentOperand.isEmpty ? Number.zero + Symbol.dot : Symbol.dot)
            self.displayLabel.text = self.displayLabel.unwrappedText + Symbol.dot
            
        case Sign.plus:
            self.currentOperand.remove(at: self.currentOperand.startIndex)
            self.displayLabel.text = DisplayFormatter.string(from: self.currentOperand)
        
        case Sign.minus:
            self.currentOperand.insert(Character(Sign.minus), at: self.currentOperand.startIndex)
            self.displayLabel.text = Sign.minus + self.displayLabel.unwrappedText
        
        default:
            return
        }
    }
    
    private func toggleSign() {
        guard self.currentOperand.isNotEmpty else { return }
        if self.currentOperand.contains(Sign.minus) {
            self.updateOperandWithDisplay(by: Sign.plus)
        } else {
            self.updateOperandWithDisplay(by: Sign.minus)
        }
    }
    
    private func setFormula(when mode: Mode) {
        switch mode {
        case .tapNumberButton:
            guard self.currentOperator.isNotEmpty else { return }
            self.formula += self.currentOperator
            self.currentOperator = Symbol.empty
        case .tapOperatorButton:
            guard self.currentOperand.isNotEmpty else { return }
            self.formula += self.currentOperand
            self.updateOperandWithDisplay(by: Symbol.empty)
        case .tapEqualButton:
            guard self.formula.isNotEmpty else { return }
            self.formula += self.currentOperator + self.currentOperand
        }
    }
    
    private func allClear() {
        self.updateOperandWithDisplay(by: Symbol.empty)
        self.currentOperator = Symbol.empty
        self.operatorLabel.text = Symbol.empty
        self.formula = Symbol.empty
    }
}

extension CalculatorViewController {
    enum Sign {
        static let plus: String = "+"
        static let minus: String = "-"
    }
    
    enum Number {
        static let all = "0"..."9"
        static let zero = "0"
    }
    
    enum Symbol {
        static let dot: String = "."
        static let empty: String = ""
    }
    
    enum Error {
        static let nan: String = "NaN"
    }
    
    enum Mode {
        case tapNumberButton, tapOperatorButton, tapEqualButton
    }
}

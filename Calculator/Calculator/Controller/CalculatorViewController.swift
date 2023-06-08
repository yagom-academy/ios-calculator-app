//
//  Calculator - CalculatorViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var recordStackView: UIStackView!
    @IBOutlet weak var recordScrollView: UIScrollView!
    
    private var currentOperand: String = ""
    private var currentOperator: String = ""
    private var formula: String = ""
    
    override func viewDidLoad() {
        self.updateOperandWithDisplay(by: Symbol.empty)
        self.operatorLabel.text = Symbol.empty
        self.recordScrollView.translatesAutoresizingMaskIntoConstraints = false
        self.recordStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @IBAction private func tapNumberButton(_ sender: UIButton) {
        self.setFormula(when: .tapNumberButton)
        self.updateOperandWithDisplay(by: sender.unwrappedTitle)
    }
    
    @IBAction private func tapDecimalPointButton(_ sender: UIButton) {
        self.updateOperandWithDisplay(by: Symbol.dot)
    }
    
    
    @IBAction private func tapOperatorButton(_ sender: UIButton) {
        self.currentOperator = sender.sign
        self.operatorLabel.text = sender.sign
        self.recordOnStack()
        self.setFormula(when: .tapOperatorButton)
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
        self.clearRecords()
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
    
    private func recordOnStack() {
        guard self.currentOperand.isNotEmpty && self.currentOperator.isNotEmpty else { return }
        let operatorLabel: UILabel = {
            let label = UILabel()
            label.text = self.currentOperator
            label.textColor = .white
            label.font = UIFont.preferredFont(forTextStyle: .title3)
            
            return label
        }()
        
        let operandLabel: UILabel = {
            let label = UILabel()
            label.text = self.displayLabel.unwrappedText
            label.textColor = .white
            label.font = UIFont.preferredFont(forTextStyle: .title3)
            
            return label
        }()
        
        let stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.alignment = .center
            stackView.spacing = 10
            
            return stackView
        }()
        
        stackView.addArrangedSubview(operatorLabel)
        stackView.addArrangedSubview(operandLabel)
        
        self.recordStackView.addArrangedSubview(stackView)
        self.scrollToBottom()
    }
    
    private func scrollToBottom() {
        self.recordScrollView.layoutIfNeeded()
        let scrollSize = self.recordScrollView.bounds.size.height
        let contentSize = self.recordStackView.bounds.size.height
        let bottomOffset = CGPoint(x: 0, y: contentSize - scrollSize)
        self.recordScrollView.setContentOffset(bottomOffset, animated: true)
    }
    
    private func clearRecords() {
        self.recordStackView.arrangedSubviews.forEach {
            self.recordStackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
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

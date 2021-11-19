//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var formulaHistoryScrollView: UIScrollView!
    @IBOutlet weak var formulaHistoryStackView: UIStackView!
    @IBOutlet weak var currentInputOperandLabel: UILabel!
    @IBOutlet weak var currentInputOperatorLabel: UILabel!
    
    var currentInputOperand: String = LabelContents.defaultOperand {
        didSet {
            updateCurrentInputLabel()
        }
    }
    
    var currentInputOperator: String = LabelContents.emptyString {
        didSet {
            updateCurrentInputLabel()
        }
    }
    
    var mathExpression: [String] = []
    var isEvaluated: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateCurrentInputLabel()
        removeAllFormulaHistory()
    }
    
    @IBAction func touchNumberButton(_ sender: UIButton) {
        guard let number = sender.titleLabel?.text else { return }
        
        if isEvaluated { return }
        
        if number == LabelContents.pointSymbole && currentInputOperand.contains(LabelContents.pointSymbole) { return }
        
        if number == LabelContents.pointSymbole && currentInputOperand == LabelContents.defaultOperand {
            currentInputOperand += number
            return
        }
        
        if number == LabelContents.doubleZero && currentInputOperand == LabelContents.defaultOperand { return }
        
        if currentInputOperand == LabelContents.defaultOperand {
            currentInputOperand = number
            return
        }
        
        currentInputOperand += number
    }

    @IBAction func touchOperatorButton(_ sender: UIButton) {
        guard let operatorSymbole = sender.titleLabel?.text else { return }
        if isEvaluated { return }
        
        if currentInputOperand == LabelContents.defaultOperand && mathExpression.isEmpty { return }
        
        if currentInputOperand == LabelContents.defaultOperand {
            updateCurrentInput(operandForm: currentInputOperand, operatorForm: operatorSymbole)
            return
        }
        
        if mathExpression.isEmpty {
            mathExpression += [currentInputOperand]
            addCurrentInputToFormulaHistory()
            updateCurrentInput(operatorForm: operatorSymbole)
            return
        }
        
        mathExpression += [currentInputOperator, currentInputOperand]
        addCurrentInputToFormulaHistory()
        updateCurrentInput(operatorForm: operatorSymbole)
    }
    
    @IBAction func touchSignChangeButton(_ sender: UIButton) {
        if currentInputOperand == LabelContents.defaultOperand { return }
        if isEvaluated { return }
        
        if currentInputOperand.hasPrefix(LabelContents.minusSignSymbole) {
            currentInputOperand.removeFirst()
            return
        }
        
        currentInputOperand.insert(contentsOf: LabelContents.minusSignSymbole, at: currentInputOperand.startIndex)
    }
    
    @IBAction func touchAllClearButton(_ sender: UIButton) {
        resetExpression()
        removeAllFormulaHistory()
    }
    
    
    @IBAction func touchClearEntryButton(_ sender: UIButton) {
        if isEvaluated == false {
            updateCurrentInput(operandForm: LabelContents.defaultOperand, operatorForm: currentInputOperator)
            return
        }
        
        resetExpression()
        removeAllFormulaHistory()
        isEvaluated = false
    }
    
    @IBAction func touchEvaluateButton(_ sender: UIButton) {
        if isEvaluated { return }
        
        mathExpression += [currentInputOperator, currentInputOperand]
        addCurrentInputToFormulaHistory()
        
        isEvaluated = true
        let stringFormula = mathExpression.joined()
        
        do {
            let result = try ExpressionParser.parse(from: stringFormula).result()
            updateCurrentInput(operandForm: String(result))
        } catch CalculatorError.divideByZero {
            updateCurrentInput(operandForm: LabelContents.notANumber)
        } catch {
            print(error)
        }
    }
    
    func addCurrentInputToFormulaHistory() {
        let stackView = UIStackView()
        stackView.spacing = 8.0
        
        let operatorSignLabelView = UILabel()
        operatorSignLabelView.text = currentInputOperator
        operatorSignLabelView.textColor = .white
        
        let operandLabelView = UILabel()
        operandLabelView.text = currentInputOperand
        operandLabelView.textColor = .white
        
        stackView.addArrangedSubview(operatorSignLabelView)
        stackView.addArrangedSubview(operandLabelView)
        
        formulaHistoryStackView.addArrangedSubview(stackView)
    }
    
    func removeAllFormulaHistory() {
        formulaHistoryStackView.arrangedSubviews.forEach({ (view: UIView) -> Void in
            view.removeFromSuperview()
        })
    }
    
    func updateCurrentInput(operandForm: String = LabelContents.defaultOperand, operatorForm: String = LabelContents.emptyString) {
        currentInputOperator = operatorForm
        currentInputOperand = operandForm
    }
    
    func updateCurrentInputLabel() {
        currentInputOperandLabel.text = currentInputOperand
        currentInputOperatorLabel.text = currentInputOperator
    }
    
    func resetExpression() {
        updateCurrentInput()
        mathExpression = []
        isEvaluated = false
    }
    
    struct LabelContents {
        static let notANumber = "NaN"
        static let emptyString = ""
        static let defaultOperand = "0"
        static let minusSignSymbole = "-"
        static let pointSymbole = "."
        static let doubleZero = "00"
    }
}


//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var currentInputOperandLabel: UILabel!
    @IBOutlet weak var currentInputOperatorLabel: UILabel!
    
    var currentInputOperand: String = LabelContents.defaultOperand {
        didSet {
            currentInputOperandLabel.text = currentInputOperand
        }
    }
    
    var currentInputOperator: String = LabelContents.emptyString {
        didSet {
            currentInputOperatorLabel.text = currentInputOperator
        }
    }
    
    var mathExpression: [String] = []
    var isEvaluated: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentInputOperandLabel.text = currentInputOperand
        currentInputOperatorLabel.text = currentInputOperator
        
    }
    
    func resetExpression() {
        currentInputOperand = LabelContents.defaultOperand
        currentInputOperator = LabelContents.emptyString
        mathExpression = []
        isEvaluated = false
    }
    
    @IBAction func touchNumberButton(_ sender: UIButton) {
        guard let number = sender.titleLabel?.text else { return }
        
        if isEvaluated { return }
        
        if currentInputOperand == LabelContents.defaultOperand {
           currentInputOperand = number
            return
        }
        
        currentInputOperand += number
    }

    @IBAction func touchOperatorButton(_ sender: UIButton) {
        guard let operatorSymbole = sender.titleLabel?.text else { return }
        if isEvaluated { return }
        
        if currentInputOperand == LabelContents.defaultOperand {
            currentInputOperator = operatorSymbole
            return
        }
        
        if mathExpression.isEmpty {
            mathExpression += [currentInputOperand]
            currentInputOperand = LabelContents.defaultOperand
            currentInputOperator = operatorSymbole
            return
        }
        
        mathExpression += [currentInputOperator, currentInputOperand]
        currentInputOperand = LabelContents.defaultOperand
        currentInputOperator = operatorSymbole
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
    }
    
    
    @IBAction func touchClearEntryButton(_ sender: UIButton) {
        if isEvaluated == false {
            currentInputOperand = LabelContents.defaultOperand
            return
        }
        
        resetExpression()
        isEvaluated = false
    }
    
    @IBAction func touchEvaluateButton(_ sender: UIButton) {
        if isEvaluated { return }
        
        mathExpression += [currentInputOperator, currentInputOperand]
        
        isEvaluated = true
        let stringFormula = mathExpression.joined()
        
        do {
            let result = try ExpressionParser.parse(from: stringFormula).result()
            currentInputOperand = String(result)
            currentInputOperator = LabelContents.emptyString
        } catch CalculatorError.divideByZero {
            currentInputOperand = LabelContents.notANumber
            currentInputOperator = LabelContents.emptyString
        } catch {
            print(error)
        }
    }
    
    struct LabelContents {
        static let notANumber = "NaN"
        static let emptyString = ""
        static let defaultOperand = "0"
        static let minusSignSymbole = "-"
    }
}


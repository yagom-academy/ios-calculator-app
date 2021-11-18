//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var currentInputOperandLabel: UILabel!
    @IBOutlet weak var currentInputOperatorLabel: UILabel!
    
    var currentInputOperand: String = "0" {
        didSet {
            currentInputOperandLabel.text = currentInputOperand
        }
    }
    
    var currentInputOperator: String = "" {
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
        currentInputOperand = "0"
        currentInputOperator = ""
        mathExpression = []
        isEvaluated = false
    }
    
    @IBAction func touchNumberButton(_ sender: UIButton) {
        guard let number = sender.titleLabel?.text else { return }
        
        if isEvaluated { return }
        
        if currentInputOperand == "0" {
           currentInputOperand = number
            return
        }
        
        currentInputOperand += number
    }

    @IBAction func touchOperatorButton(_ sender: UIButton) {
        guard let operatorSymbole = sender.titleLabel?.text else { return }
        if isEvaluated { return }
        
        if currentInputOperand == "0" {
            currentInputOperator = operatorSymbole
            return
        }
        
        if mathExpression.isEmpty {
            mathExpression += [currentInputOperand]
            currentInputOperand = "0"
            currentInputOperator = operatorSymbole
            return
        }
        
        mathExpression += [currentInputOperator, currentInputOperand]
        currentInputOperand = "0"
        currentInputOperator = operatorSymbole
    }
    
    @IBAction func touchSignChangeButton(_ sender: UIButton) {
        if currentInputOperand == "0" { return }
        if isEvaluated { return }
        
        if currentInputOperand.hasPrefix("-") {
            currentInputOperand.removeFirst()
            return
        }
        
        currentInputOperand.insert("-", at: currentInputOperand.startIndex)
    }
    
    @IBAction func touchAllClearButton(_ sender: UIButton) {
        resetExpression()
    }
    
    
    @IBAction func touchClearEntryButton(_ sender: UIButton) {
        if isEvaluated == false {
            currentInputOperand = "0"
            return
        }
        
        resetExpression()
        isEvaluated = false
    }
}


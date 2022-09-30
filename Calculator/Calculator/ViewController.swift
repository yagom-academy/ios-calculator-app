//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    private var operand: String = ""
    private var arithmeticOperator: String = ""
    private var isDotButtonTapped: Bool = false
    private var isFirstInput: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setOperandLabelToZero()
        setOperatorLabelEmpty()
    }
    
    @IBAction func oneToNineOperandButtonTapped(_ sender: UIButton) {
        guard let selectedOperand = Operand.matchOperandButtonTag(location: sender.tag) else {
            return
        }
        
        updateOperandLabel(with: selectedOperand.bringOperandSymbol)
        isFirstInput = false
    }
    
    @IBAction func dotButtonTapped(_ sender: Any) {
        if !operand.isEmpty && !isDotButtonTapped {
            updateOperandLabel(with: ".")
            isDotButtonTapped = true
        }
    }
    
    @IBAction func zeroButtonTapped(_ sender: Any) {
        if !operand.isEmpty {
            updateOperandLabel(with: "0")
        }
    }
    
    @IBAction func operatorButtonTapped(_ sender: UIButton) {
        guard let selectedOperator = sender.currentTitle else {
            return
        }
        
        if isFirstInput {
            return
        }
        
        updateOperatorLabel(with: selectedOperator)
    }
    
    func updateOperandLabel(with input: String) {
        operand += input
        operandLabel.text = operand
    }
    
    func updateOperatorLabel(with input: String) {
        arithmeticOperator = input
        operatorLabel.text = arithmeticOperator
    }

    func setOperandLabelToZero() {
        operandLabel.text = "0"
    }
    
    func setOperatorLabelEmpty() {
        operatorLabel.text = ""
    }
}


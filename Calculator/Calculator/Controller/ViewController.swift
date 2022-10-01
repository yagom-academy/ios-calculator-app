//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var formulaStackView: UIStackView!
    
    private var operand: String = ""
    private var arithmeticOperator: String = ""
    private var finalFormula: String = ""
    private var isDotButtonTapped: Bool = false
    private var isFirstInput: Bool = true
    private var isNegativeSign: Bool = false
    private var isCalculate: Bool = false
    
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
    
    @IBAction func doubleZeroButtonTapped(_ sender: Any) {
        if !operand.isEmpty {
            updateOperandLabel(with: "00")
        }
    }
    
    @IBAction func operatorButtonTapped(_ sender: UIButton) {
        guard let selectedOperator = sender.currentTitle else {
            return
        }
        
        guard !isFirstInput else {
            return
        }
        
        updateOperatorLabel(with: selectedOperator)
        guard !operand.isEmpty else {
            return
        }
        
        removeLastDot()
        creatStackView()
        setOperandLabelToZero()
        creatFinalFormula()
        operand.removeAll()
        isDotButtonTapped = false
    }
    
    @IBAction func allClearButtonTapped(_ sender: Any) {
        setOperandLabelToZero()
        setOperatorLabelEmpty()
        formulaStackView.arrangedSubviews.forEach { view in
            view.removeFromSuperview()
        }
        
        isFirstInput = true
        isDotButtonTapped = false
        operand.removeAll()
        arithmeticOperator.removeAll()
        finalFormula.removeAll()
    }
    
    @IBAction func clearEntryButtonTapped(_ sender: Any) {
        if !operand.isEmpty {
            operand.removeAll()
            setOperandLabelToZero()
        }
        
        if finalFormula.isEmpty {
            isFirstInput = true
        }
    }
    
    @IBAction func toggleSignButtonTapped(_ sender: Any) {
        if operand.isEmpty {
            return
        }
        
        if !isNegativeSign {
            operand = "-" + operand
        } else {
            operand = operand.trimmingCharacters(in: ["-"])
        }
        
        operandLabel.text = operand
        isNegativeSign.toggle()
    }
    
    func creatStackView() {
        let stackView = LogStackView(operand: operand, arithmeticOperator: arithmeticOperator)
        formulaStackView.addArrangedSubview(stackView)
    }
    
    func removeLastDot() {
        operand = operand.trimmingCharacters(in: ["."])
    }
    
    func creatFinalFormula() {
        finalFormula += arithmeticOperator
        finalFormula += operand
    }
    
    func updateOperandLabel(with input: String) {
        operand += input
        operandLabel.text = operand
    }
    
    func updateOperatorLabel(with input: String) {
        if !isCalculate {
            arithmeticOperator = input
            operatorLabel.text = arithmeticOperator
        }
    }

    func setOperandLabelToZero() {
        operandLabel.text = "0"
    }
    
    func setOperatorLabelEmpty() {
        operatorLabel.text = ""
    }
}


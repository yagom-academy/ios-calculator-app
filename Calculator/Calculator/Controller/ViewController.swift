//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var acButton: UIButton!
    @IBOutlet private weak var ceButton: UIButton!
    @IBOutlet private weak var negativeButton: UIButton!
    @IBOutlet private weak var divideButton: UIButton!
    @IBOutlet private weak var multiplyButton: UIButton!
    @IBOutlet private weak var subtractButton: UIButton!
    @IBOutlet private weak var addButton: UIButton!
    @IBOutlet private weak var equalButton: UIButton!
    
    @IBOutlet private weak var currentOperatorLabel: UILabel!
    @IBOutlet private weak var currentOperandLabel: UILabel!
    
    @IBOutlet private weak var formulaListScrollView: UIScrollView!
    @IBOutlet private weak var formulaListStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCurrentStatus()
        deleteAllFormulaListStackView()
    }
    
    @IBAction private func touchUpButton(_ sender: UIButton) {
        switch sender {
        case acButton:
            deleteAllFormulaListStackView()
            setUpCurrentStatus()
        case ceButton:
            currentOperandLabel.text = "0"
        case negativeButton:
            guard let currentOperand = currentOperandLabel.text,
                  let firstString = currentOperand.first,
                  currentOperand != "0" else {
                return
            }
            guard firstString != "-" else {
                currentOperandLabel.text = String(currentOperand.dropFirst(1))
                return
            }
            currentOperandLabel.text = "-" + currentOperand
        case divideButton, multiplyButton, subtractButton, addButton:
            guard let currentOperand = currentOperandLabel.text,
                  let senderTitle = sender.title(for:.normal) else {
                return
            }
            guard currentOperand != "0" else {
                currentOperatorLabel.text = senderTitle
                return
            }
            addNewFormulaStackView()
            currentOperandLabel.text = "0"
            currentOperatorLabel.text = senderTitle
        case equalButton:
            guard let currentOperator = currentOperatorLabel.text,
                  currentOperator != "" else {
                return
            }
            return
        default:
            guard let currentOperand = currentOperandLabel.text,
                  let senderTitle = sender.title(for:.normal) else { return }
            guard currentOperand != "0" else {
                currentOperandLabel.text = senderTitle
                return
            }
            currentOperandLabel.text = currentOperand + senderTitle
        }
    }
    
    private func addNewFormulaStackView() {
        guard let currentOperand = currentOperandLabel.text,
              let currentOperator = currentOperatorLabel.text else {
            return
        }
        let newFormulaStackView = UIStackView()
        let operatorLabel = UILabel()
        let operandLabel = UILabel()
        operatorLabel.text = currentOperator
        operandLabel.text = currentOperand
        newFormulaStackView.addArrangedSubview(operatorLabel)
        newFormulaStackView.addArrangedSubview(operandLabel)
        formulaListStackView.addArrangedSubview(newFormulaStackView)
    }
    
    private func setUpCurrentStatus() {
        currentOperandLabel.text = "0"
        currentOperatorLabel.text = ""
    }
    
    private func deleteAllFormulaListStackView() {
        formulaListStackView.arrangedSubviews.forEach { stack in
            formulaListStackView.removeArrangedSubview(stack)
        }
    }

    func formatNumber(_ number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 20
        numberFormatter.roundingMode = .halfUp
        
        guard let numberFormatted = numberFormatter.string(for: number) else { return "" }
        
        return numberFormatted
    }
}


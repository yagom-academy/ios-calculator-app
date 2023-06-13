//
//  Calculator - ViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var userTyping = false
    private var formula = ""
    private var initalNumber = 0
    private let numberFormatter = NumberFormatter()
    
    @IBOutlet weak var displayOperandLabel: UILabel!
    @IBOutlet weak var displayOperatorLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNUmberForatter()
    }
    
    @IBAction func touchDigit(_ sender: UIButton) {
        guard let digit = sender.currentTitle else { return }
        
        if userTyping {
            let currentText = displayOperandLabel.text!
            displayOperandLabel.text = currentText + digit
        } else {
            displayOperandLabel.text = digit
        }
        
        userTyping = true
    }
    
    @IBAction func touchOperator(_ sender: UIButton) {
        guard displayOperatorLabel.text != "0", userTyping == false else {
            displayOperatorLabel.text = sender.currentTitle
            return
        }
        
        addFormula()
    }
    
    @IBAction func touchCalculate(_ sender: UIButton) {
        guard userTyping == false else { return }
    }
    
    @IBAction func touchMenu(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        
        switch title {
        case "AC":
            clearOperandLabel()
            clearOperatorLabel()
        case "CE":
            clearOperandLabel()
            print("clearEntry")
        case "⁺⁄₋":
            print("chageSign")
        case ".":
            print(".")
        case "00":
            print("00")
        default:
            break
        }
    }
    
    private func addFormula() {
        guard let currentOperands = displayOperandLabel.text,
              let operands = numberFormatter.string(for: Double(currentOperands)),
              let `operator` = displayOperatorLabel.text else { return }
        
        if formula.isEmpty && operands != "0" {
            formula += operands
            addStackView("", operands)
        } else if operands != "0" {
            formula += "\(`operator`) \(operands)"
            addStackView(`operator`, operands)
        }
        
        if `operator` == String(Operator.divide.rawValue) && operands == "0" {
            formula += "\(`operator`) \(operands)"
        }
    }
    
    private func addOperandLabel() {
        
    }
    
    private func addStackView(_ `operator`: String, _ operands: String) {
        let label = UILabel()
        label.text = "\(`operator`) \(operands)"
        
        stackView.addArrangedSubview(label)
    }

    private func clearOperandLabel() {
        displayOperandLabel.text = "0"
    }
    
    private func clearOperatorLabel() {
        displayOperatorLabel.text?.removeAll()
    }
    
    private func clearStackView() {
        stackView.arrangedSubviews.forEach{ $0.removeFromSuperview() }
    }
    
    private func changeSign() {
        guard var operands = displayOperandLabel.text, operands != "0" else { return }
        
        if operands.contains("-") {
            operands.removeFirst()
        } else {
            operands.insert(Character("-"), at: operands.startIndex)
        }
        
        displayOperandLabel.text = operands
    }
    
    private func calculateResult() -> String? {
        
        return nil
    }
    
    private func setNUmberForatter() {
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = -2
        numberFormatter.maximumIntegerDigits = 20
        numberFormatter.maximumSignificantDigits = 20
        numberFormatter.usesSignificantDigits = true
    }
}

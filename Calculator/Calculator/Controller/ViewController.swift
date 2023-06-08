//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    private var formula: String = ""
    private let numberFormatter = NumberFormatter()
    
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var operandsLabel: UILabel!
    @IBOutlet private weak var stackView: UIStackView!
    @IBOutlet private weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearLabel()
        clearStackView()
        setNumberFormatter()
    }
    
    @IBAction private func TapOperatorButton(_ sender: UIButton) {
        guard let inputOperator = sender.currentTitle else { return }
        
        addFormula()
        setOperatorLabel(inputOperator)
    }
    
    @IBAction private func TapEqualButton(_ sender: UIButton) {
        addFormula()
        
        guard let result = calculateFormula() else { return }
        
        setOperandsLabel(result)
        clearFormula()
        clearStackView()
    }
    
    @IBAction private func TapNumberButton(_ sender: UIButton) {
        guard let inputNumber = sender.currentTitle else { return }
        
        addOperandsLabel(inputNumber)
    }
    
    @IBAction private func TapDecimalPointButton(_ sender: UIButton) {
        guard let inputDecimalPoint = sender.currentTitle else { return }
        
        addOperandsLabel(inputDecimalPoint)
    }
    
    @IBAction private func TapACButton(_ sender: UIButton) {
        clearLabel()
        clearFormula()
        clearStackView()
    }
    
    @IBAction private func TapCEButton(_ sender: UIButton) {
        clearLabel()
    }
    
    @IBAction private func TapChangeSignButton(_ sender: UIButton) {
        changeSign()
    }
    
    private func calculateFormula() -> String? {
        var parsedFormula = ExpressionParser.parse(from: formula)
        return numberFormatter.string(for: parsedFormula.result())
    }
    
    private func addFormula() {
        guard let operands = operandsLabel.text,
              let `operator` = operatorLabel.text else { return }
        
        if formula.isEmpty && operands != "0"  {
            formula += "\(operands) "
            addDetailStackView("", operands)
        } else if operands != "0" {
            formula += "\(`operator`) \(operands) "
            addDetailStackView(`operator`, operands)
        }
        
        if `operator` == "÷" && operands == "0" {
            formula += "\(`operator`) \(operands) "
        }
        
        clearLabel()
    }
    
    private func addOperandsLabel(_ input: String) {
        guard let operands = operandsLabel.text?.replacingOccurrences(of: ",", with: ""),
              let num = Double(operands + input),
              let result = numberFormatter.string(for: num) else { return }
        
        if operands.contains(".") && (input == "0" || input == "00") {
            let result = operands + input
            setOperandsLabel(result)
            return
        } else if !operands.contains(".") && input == "." {
            let result = operands + input
            setOperandsLabel(result)
            return
        }
        
        setOperandsLabel(result)
    }
    
    private func addDetailStackView(_ `operator`: String, _ operands: String) {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = .white
        label.text = "\(`operator`) \(operands)"
        label.textAlignment = .right
        
        stackView.addArrangedSubview(label)
        scrollView.scrollToBottom(animated: false)
    }
    
    private func changeSign() {
        guard var operands = operandsLabel.text else { return }
        
        if operands.contains("-") {
            operands.removeFirst()
        } else {
            operands.insert("-", at: operands.startIndex)
        }
        
        setOperandsLabel(operands)
    }
    
    private func setOperatorLabel(_ data: String) {
        operatorLabel.text = data
    }
    
    private func setOperandsLabel(_ data: String) {
        operandsLabel.text = data
    }
    
    private func setNumberFormatter() {
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = -2
        numberFormatter.maximumIntegerDigits = 20
        numberFormatter.maximumSignificantDigits = 20
        numberFormatter.usesSignificantDigits = true
    }
    
    private func clearLabel() {
        operandsLabel.text = "0"
        operatorLabel.text?.removeAll()
    }
    
    private func clearStackView() {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    private func clearFormula() {
        formula.removeAll()
    }
}


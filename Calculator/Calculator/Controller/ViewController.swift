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
        guard let title = sender.currentTitle else { return }
        
        addFormula()
        
        operatorLabel.text = title
    }
    
    @IBAction private func TapEqualButton(_ sender: UIButton) {
        addFormula()
        
        var formula = ExpressionParser.parse(from: self.formula)
        guard let result = numberFormatter.string(for: formula.result()) else { return }
        
        setOperandsLabel(result)
        clearFormula()
        clearStackView()
    }
    
    @IBAction private func TapNumberButton(_ sender: UIButton) {
        guard let inputNumber = sender.currentTitle,
              let operands = operandsLabel.text?.replacingOccurrences(of: ",", with: ""),
              let num = Double(operands + inputNumber),
              let result = numberFormatter.string(for: num) else { return }
        
        setOperandsLabel(result)
    }
    
    @IBAction private func TapDecimalPointButton(_ sender: UIButton) {
        guard let inputNumber = sender.currentTitle,
              let operands = operandsLabel.text else { return }
        
        let result = operands + inputNumber
        
        setOperandsLabel(result)
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
        guard var operands = operandsLabel.text else { return }
        
        if operands.contains("-") {
            operands.removeFirst()
        } else {
            operands.insert("-", at: operands.startIndex)
        }
        
        setOperandsLabel(operands)
    }
    
    private func addFormula() {
        guard let operands = operandsLabel.text,
              let `operator` = operatorLabel.text else { return }
        
        if self.formula == "" && operands != "0"  {
            self.formula += "\(operands) "
            addDetailStackView("", operands)
            clearLabel()
        } else if operands != "0" {
            self.formula += "\(`operator`) \(operands) "
            addDetailStackView(`operator`, operands)
            clearLabel()
        }
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
    
    private func setOperandsLabel(_ data: String) {
        operandsLabel.text = data
    }
    
    private func setNumberFormatter() {
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = -2
        numberFormatter.maximumSignificantDigits = 20
        numberFormatter.usesSignificantDigits = true
    }
    
    private func clearLabel() {
        operandsLabel.text = "0"
        operatorLabel.text = ""
    }
    
    private func clearStackView() {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    private func clearFormula() {
        self.formula = ""
    }
}


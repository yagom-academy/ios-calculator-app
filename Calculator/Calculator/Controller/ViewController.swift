//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var presentValue: UILabel!
    @IBOutlet weak var presentOperator: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    
    private var inputOperand: String = ""
    private var inputValues: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        removeHistory()
    }
    
    @IBAction private func didTapOperand(sender: UIButton) {
        guard let buttonLabel = sender.titleLabel?.text else { return }
        
        if inputOperand.count >= 16 {
            return
        }
        
        if inputOperand == "0" && buttonLabel == "0" || inputOperand == "0" && buttonLabel == "00" {
            return
        }
        
        if inputOperand == "0" {
            inputOperand = buttonLabel
            presentValue.text = inputOperand
            return
        }
        
        if inputOperand.last == "." || inputOperand.last == "0" {
            inputOperand += buttonLabel
            presentValue.text = inputOperand
            return
        }
        
        inputOperand += buttonLabel
        presentValue.text = numberFormatter(number: inputOperand)
    }
    
    @IBAction private func didTapOperator(sender: UIButton) {
        guard let buttonLabel = sender.titleLabel?.text else { return }
        guard let operatorLabel = presentOperator.text else { return }
        guard let operandLabel = presentValue.text else { return }
        
        if inputOperand == "0" {
            return
        }
        
        let newStackView = pushStackView(operandText: operatorLabel, operatorText: operandLabel)
        stackView.addArrangedSubview(newStackView)
        scrollView.scrollToBottom()
        inputValues.append(inputOperand)
        inputValues.append(buttonLabel)
        inputOperand = "0"
        presentValue.text = inputOperand
        presentOperator.text = buttonLabel
    }
    
    @IBAction private func didTapDot(sender: UIButton) {
        guard let buttonLabel = sender.titleLabel?.text else { return }
        guard let lableText = presentValue.text else { return }
        
        if inputOperand.contains(".") {
            return
        }
        
        inputOperand += buttonLabel
        presentValue.text = lableText + buttonLabel
    }
    
    @IBAction private func changeSign(sender: UIButton) {
        if inputOperand == "0" {
            return
        }
        
        let converteDouble = Double(inputOperand) ?? .zero
        inputOperand = String(converteDouble * -1)
        presentValue.text = numberFormatter(number: inputOperand)
    }
    
    @IBAction private func didTapEqualSign() {
        guard let operatorLabel = presentOperator.text else { return }
        guard let operandLabel = presentValue.text else { return }
        
        if operandLabel == "0" {
            return
        }
        
        let newStackView = pushStackView(operandText: operatorLabel, operatorText: operandLabel)
        stackView.addArrangedSubview(newStackView)
        scrollView.scrollToBottom()
        
        let valueToBeCalculated = inputValues.joined(separator: " ") + " " + inputOperand
        var fomula = ExpressionParser.parse(from: valueToBeCalculated)
        let result = String(fomula.result())
        presentValue.text = numberFormatter(number: result)
        presentOperator.text = ""
    }
    
    @IBAction private func didTapAC() {
        removeHistory()
    }
    
    @IBAction private func didTapCE() {
        inputOperand = "0"
        presentValue.text = inputOperand
    }
}

extension UIScrollView {
    fileprivate func scrollToBottom() {
        self.layoutIfNeeded()
        let bottomOffset = CGPoint(x: 0, y: self.contentSize.height - self.bounds.size.height)
        self.setContentOffset(bottomOffset, animated: true)
    }
}

extension ViewController {
    
    private func removeHistory() {
        stackView.subviews.forEach{ (view) in view.removeFromSuperview() }
        presentValue.text = "0"
        presentOperator.text = ""
        inputOperand = "0"
        inputValues.removeAll()
    }
    
    private func numberFormatter(number: String) -> String {
        let convertedNumber = Double(number)
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
        
        let result = numberFormatter.string(for: convertedNumber) ?? "NaN"
        
        return result
    }
    
     private func pushStackView(operandText: String?, operatorText: String?) -> UIStackView {
        let operand = UILabel()
        let `operator` = UILabel()
        
        operand.text = operandText
        `operator`.text = operatorText
        operand.textColor = .white
        `operator`.textColor = .white
        
        let newStackView = UIStackView()
        newStackView.axis = .horizontal
        newStackView.distribution = .fill
        newStackView.spacing = 10
        
        newStackView.addArrangedSubview(operand)
        newStackView.addArrangedSubview(`operator`)
        return newStackView
    }
}
